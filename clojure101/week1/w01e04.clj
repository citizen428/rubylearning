(ns week1
  (:use [clojure.test]
        [clojure.contrib.math :only (expt round sqrt)]))

(def phi (/ (inc (sqrt 5)) 2))

(defn nth-fib [n]
  (round (/ (expt phi n) (sqrt 5))))

(def nth-fib-m (memoize nth-fib))

(deftest test-nth-fib
  (is (= (map nth-fib [10 20 30 40 50 60 70])
         '(55 6765 832040 102334155 12586269025 1548008755920 190392490709135))
      "Check numbers specified in exercise description")) 

(run-tests)
  
