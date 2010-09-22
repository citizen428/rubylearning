(def cities [{:city "Vienna" :temp 55} {:city "Krakow" :temp 52} {:city "Pune" :temp 85} {:city "Houston" :temp 57}])
 
(defn in-celsius
  [temp]
  (* (/ 5 9) (- temp 32)))
 
(defn average-as-float
  [elements]
  (float (/ (reduce + elements) (count elements))))
 
(defn avg-temp
  ([cities & [conv]]
     (let [temps (map :temp cities)]
       (if conv
         (average-as-float (map conv temps))
         (average-as-float temps)))))
 
(println (format "Average temperature: %.2f degrees F" (avg-temp cities)))
(println (format "Average temperature: %.2f degrees C" (avg-temp cities in-celsius)))
