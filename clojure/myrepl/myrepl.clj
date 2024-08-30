(ns myrepl
  (:require
    [clojure.java.io :as io]

    [nrepl.server :as nrepl]
    [rebel-readline.main :as rebel]))

(defn nrepl-handler []
  (require 'cider.nrepl)
  (ns-resolve 'cider.nrepl 'cider-nrepl-handler))

(defn -main [& args]
  (let [port (or (some-> *command-line-args*
                         first
                         Long/parseLong)
                 0)
        server (nrepl/start-server :port port :handler (nrepl-handler))]
    (spit "./.nrepl-port" (:port server))
    (println "Started nrepl on port" (:port server))
    (apply rebel/-main (rest *command-line-args*))
    (nrepl/stop-server server)
    (io/delete-file "./.nrepl-port" :no-fail)
    (shutdown-agents)))
