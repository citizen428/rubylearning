(def results
     [0 0 0 1 0 1 1 1 1 0 1 1 0 1 0 0 1 1 1 0 0 1 0 1])

(defn passed? [res] (= res 1))

(defn process
  [results] 
  (let [passed (count (filter passed? results))
        total (count results)]
    (println (format "%d / %d students passed (%.2f%%)"
                     passed
                     total
                     (float (* 100 (/ passed total)))))))

(defn -main
  []
  (process results))

(-main)
