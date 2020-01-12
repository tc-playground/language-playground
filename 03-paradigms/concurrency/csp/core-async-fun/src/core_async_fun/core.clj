(ns core-async-fun.core
  (:require [clojure.core.async :as async :refer :all
    :exclude [map into reduce merge partition partition-by take transduce]])
  (:gen-class)
  )

; (require '[clojure.core.async :as async :refer :all])
; (require '[clojure.core.async :as async :refer [>! <! >!! <!! go]])
; (require '[clojure.core.async :as async :refer [>! <! >!! <!! go chan]])

; (ns channels.core
; (:require [clojure.core.async :as async :refer :all
; :exclude [map into reduce merge partition partition-by take]]))

(defn -main
  "Entry point..."
  [& args]
  (println "Starting..."))

; Read and write from channels.
;
; (def ch (chan 10))
; (writeall!! ch (range 0 10))
; (readall!! ch)

(defn writeall!! 
  [ch coll]
  "Write everything in the collection to the specified channel."
  (doseq [x coll] (>!! ch x))
  (close! ch))

(defn readall!! 
  [ch]
  "Read everything from the specified channel into a collection."
  (loop [coll []]
    (if-let [x (<!! ch)]
      (recur (conj coll x))
      coll)))

; Read and write from channels using standard async functions. 
; 
; (def ch (chan 10))
; (onto-chan ch (range 0 10))
; (<!! (async/into [] ch))

; go blocks are cheap - we can have many of them. (Although 100000000 does stress the processor!)
(defn go-add 
  [x y]
  "A wierd way to add two numbers using channels."
  (<!! (nth (iterate #(go (inc (<! %))) (go x)) y)))


; map-chan usage
;
; (def ch (chan 10))
; (def mapped (map-chan (partial * 2) ch))
; (onto-chan ch (range 0 10))
; (<!! (async/into [] mapped))

; map<
; filter<
; mapcat<

; `map` hof implemented with channels.
(defn map-chan 
  [f from]
  "`map` hof implemented with channels"
  (let [to (chan)]
    (go-loop []
      (when-let [x (<! from)]
        (>! to (f x)))
      (recur))
    (close! to)
    to))

