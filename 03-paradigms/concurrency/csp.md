# Sequential Concurrent Processes

## Channels

* A `channel` is a thread-safe queue.

* Any task with a reference to a channel can `add messages` (write).

* Any task with a reference to a channel can `take messages` (read).

* Channels can be `synchronous` (or `unbuffered`) — writing to a channel `blocks` until something reads from it.

* Channels can be `buffered` with enough space to hold `n` messages.

* Channels can be `closed`. Reading from a closed channel returns a `nil` result or equivalent. Writing discards the message.

* `Channel full buffer strategies`

    * `default` : Writing to a `full channel` blocks.

    * `dropping-buffer` : Drop new messages when capacity is reached.

    * `sliding-buffer` : Drop the oldest message when capacity is reached.

    * >NB: Erlang `actors` have unbounded inboxes. However, these can hide issues when exhausted.

> NB: Unlike `actors`, where messages are sent to and from specific actors, senders don’t have to know about receivers, or vice versa.

---

## Go Blocks

* `Thread Pools` manage and allocated a set of `pre-initialised` thread resources.

    * > NB: This is problematic if the `threads` need to block and the code is not `event driven`, as the thread is held up.

* `Go blocks` provide the efficiency of event-driven code without having to compromise its structure or readability. 

    * They achieve this by transparently `rewriting sequential code into event-driven code` under the hood.

    * Code within a go block is transformed into a `state machine`. 
    
    * Instead of `blocking` when it reads from or writes to a channel, the state machine `parks`.
    
    * `Parking` relinquishing control of the `thread` it’s executing on. 
    
    * When it’s next able to run, it performs a `state transition` and `continues execution`, potentially on another thread.

    * `go blocks` return a channel from which the results can be read.

    * `go blocks` are cheap.

---

## Operations over Channels - Sequences

* Like `sequences`, `channels` represent ordered sets of values.

* Channels support `higher order function`s over the channels contents: `map`, `reduce`, `filter`, etc.

* Functions over channels support `composition`.


---

## Clojure Examples

* [Core Async - Walkthrough](https://github.com/clojure/core.async/blob/master/examples/walkthrough.clj)

* Channel `create`, `<!!` (blocking read), and `>!!` (blocking write):

    ```
    (def c (chan))
    (thread (println "Read:" (<!! c) "from c"))
    (>!! c "Hello thread!")
    ```

    > NB: `thread` is a macro that runs the code in a separate thread.

* Channel `create`, `<!` (parking read), and `>!` (parking write):

    ```
    channels.core=> (def ch (chan))
    #'channels.core/ch
    channels.core=> (go
    #_=>
    (let [x (<! ch)
    #_=>
    y (<! ch)]
    #_=>
    (println "Sum:" (+ x y))))
    #<ManyToManyChannel clojure.core.async.impl.channels.ManyToManyChannel@13ac7b98>
    channels.core=> (>!! ch 3)
    nil
    channels.core=> (>!! ch 4)
    nil
    Sum: 7
    ```

    * >NB: The `go` macro transforms this into a `state machine` that is `parked` at each `state transition`:

        ```start -> <! -> <! -> output results -> end```

