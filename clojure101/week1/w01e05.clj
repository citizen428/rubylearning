;; 1.1 Destructuring a map
(defn print-book
  "Prints out information about a book."
  [ {title :title authors :authors price :price}]
  (println "Title:" title)
  (println "  Author: " (comma-sep authors))
  (println "  Price:" (money-str price)))

;; 1.2 Destructuring a map using :keys
(defn print-book
  "Prints out information about a book."
  [ {:keys [title authors price]} ]
  (println "Title:" title)
  (println "  Author: " (comma-sep authors))
  (println "  Price:" (money-str price)))

;; 2.1 Destructuring a vector
(defn print-book
  "Prints out information about a book."
  [{:keys [title authors price]}] 
  (println "Title:" title)
  (let [[first second & more] authors]     
    (println "  Author:" (comma-sep
                          (filter seq [first second
                                       (when more "et. al.")]))))
  (println "  Price:" (money-str price)))

;; 2.2 Destructuring with :as
(defn print-book
  "Prints out information about a book."
  [{:keys [title authors price] :as book}] 
  (println "Title:" title)
  (let [[first second & more] authors]     
    (println "  Author:" (comma-sep
                          (filter seq [first second
                                       (when more "et. al.")]))))
  (println "  Price:" (money-str price))
  (println "  Raw:" (pr-str book)))
