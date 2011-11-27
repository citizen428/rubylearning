(defconstant seconds-per-year (* 60 60 24 365))

(defun age-in-seconds (age)
  (/ age seconds-per-year))

(format t "~$~%" (age-in-seconds 979000000))
