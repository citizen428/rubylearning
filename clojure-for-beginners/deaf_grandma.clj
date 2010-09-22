(defn all-caps?
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
    (let [input (read-line)
          no (format "NO, NOT SINCE %d!" (rand-year))]
      (cond
       (and (= bye-count 2)
            (= input "BYE"))
       (do (println "BYE SONNY!") (System/exit 0))
       (= input "BYE") (recur no (inc bye-count))
       (all-caps? input) (recur no 0)
       :else (recur "HUH, SPEAK UP SONNY!" 0)))))

(defn -main
  []
  (grandma "HI SONNY!"))

(-main)
