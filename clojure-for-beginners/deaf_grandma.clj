(defn all-caps
  [input]
  (= input (.toUpperCase input)))

(defn rand-year
  []
  (+ 1930 (rand-int 21)))

(defn grandma
  [prompt]
  (loop [prompt prompt
         bye-count 0]
    (println prompt)
    (let [input (read-line)]
      (cond
       (and (= bye-count 2)
            (= input "BYE"))
       (do (println "BYE SONNY!") (System/exit 0))
       (= input "BYE") (recur (str "NO, NOT SINCE " (rand-year) "!") (inc bye-count))
       (all-caps input) (recur (str "NO, NOT SINCE " (rand-year) "!") 0)
       :else (recur "HUH, SPEAK UP SONNY!" 0)))))

(defn -main
  []
  (grandma "HI SONNY!"))

(-main)
