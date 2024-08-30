(ns r
  (:require
    [clojure.pprint :as pp]
    [clojure.tools.logging :as log]

    [lucid.core.inject :as inject]))

(defn dbg>
  ([x] (pp/pprint x) x)
  ([x msg] (println msg) (pp/pprint x) x)
  ([x msg f] (println msg) (pp/pprint (f x)) x))

(defn dbg>>
  ([x] (pp/pprint x) x)
  ([msg x] (println msg) (pp/pprint x) x)
  ([msg f x] (println msg) (pp/pprint (f x)) x))

(defn log>
  ([x] (log/info (with-out-str (pp/pprint x))) x)
  ([x msg] (log/infof "%s:\n%s" (with-out-str (pp/pprint x))) x)
  ([x msg f] (log/infof "%s:\n%s" (with-out-str (pp/pprint (f x)))) x))

(defn log>>
  ([x] (log/info (with-out-str (pp/pprint x))) x)
  ([msg x] (log/infof "%s:\n%s" (with-out-str (pp/pprint x))) x)
  ([msg f x] (log/infof "%s:\n%s" (with-out-str (pp/pprint (f x)))) x))

(inject/inject
  '[r
    (clojure.pprint pp pprint)
    (clojure.repl apropos dir doc find-doc source [root-cause cause])
    (clojure.tools.namespace.repl refresh)
    (io.aviso.repl [pretty-pst pst] [format-exception fst])
    (kaocha.repl [run run-tests])])
