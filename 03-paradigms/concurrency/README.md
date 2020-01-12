
# Parallel Programming and Concurrency Models

## `Concurrent` vs `Parallel`

---

## `Threads and Locks`

---

## `Eliminate Mutable State` - Functional Programming

---

## `Separate Identity and State` - Clojure

* `Software Transactional Memory`

---

## `Actor Model` - Erlang / Elixir

* Similar to `CSP`.

* First class `actors` that are (light-weight) `threads` that have `mailboxes` and communicate by passing `messages`.

* `Thread hierarchies` allow `supervisor` threads to monitor and re-start `managed threads` for robustness and fail-over.

* `Erlang` / `Elixir`.

* `Erlang BEAM VM` support many light-weight actor threads with a `scheduler` to allow fair execution policies between them.

---

### `Communicating Sequential Process (CSP) Model` - Golang

* Similar to `Actors`.

* First class `channels`. Not tied to specific actors/processes.

---

### `Data Pipeline Parallelism` - Graphics Cards, Super-Scaler architectures

---

### `Lambda Architecture` - Map Reduce / Stream Processing

---

### `Asynchronous Event Driven Architectures`