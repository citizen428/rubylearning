(defn all-caps
  [input]
  (= input (.toUpperCase input)))

(defn rand-year
  []
  (+ 1930 (rand-int 21)))

(defn grandma
  ([prompt]
     (grandma prompt 0))
  ([prompt bye-count]
     (println prompt)
     (let [input (read-line)]
       (cond
        (and (= bye-count 2)
             (= input "BYE"))
        (do (println "BYE SONNY!") (System/exit 0))
        (= input "BYE") (grandma (str "NO, NOT SINCE " (rand-year) "!") (inc bye-count))
        (all-caps input) (grandma (str "NO, NOT SINCE " (rand-year) "!") 0)
        :else (grandma "HUH, SPEAK UP SONNY!" 0)))))

(defn -main
  []
  (grandma "HI SONNY!"))

(-main)
