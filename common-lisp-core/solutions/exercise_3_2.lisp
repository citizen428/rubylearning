(defun range (start end &key step)
  (let ((step (or step 1)))
    (loop for i from start to end by step collect i)))
