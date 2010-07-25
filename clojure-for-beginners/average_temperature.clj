(def cities [{:city "Vienna" :temp 55} {:city "Krakow" :temp 52} {:city "Pune" :temp 85} {:city "Houston" :temp 57}])
 
(defn in-celsius
  [temp]
  (float (* (/ 5 9) (- temp 32))))
 
(defn average-as-float
  [elements]
  (float (/ (reduce + elements) (count elements))))
 
(defn avg-temp
  ([cities & [conv]]
     (if conv
       (average-as-float (map conv (map :temp cities)))
       (average-as-float (map :temp cities)))))
 
(println (str "Average temperature: " (format "%.2f" (avg-temp cities)) " degrees F"))
(println (str "Average temperature: " (format "%.2f" (avg-temp cities in-celsius)) " degrees C"))