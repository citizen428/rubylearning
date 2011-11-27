(defun leap-year-p (year)
  (or (and (not (zerop (mod year 100 )))
           (zerop (mod year 4)))
      (zerop (mod year 400))))
