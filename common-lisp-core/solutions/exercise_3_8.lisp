(defparameter *results* '(1 1 1 0 0 1 0 1 0 0 1 1 1 0 1 0 1 1 0))

(defun exam-summary (list)
  (let* ((passed (count 1 list))
         (total (length list))
         (percent (* 100 (/ passed total))))
    (format t
            "~d out of ~d students passed the exam (~$%).~%"
            passed
            total
            percent)))
