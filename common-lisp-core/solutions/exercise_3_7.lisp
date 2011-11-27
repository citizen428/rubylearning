(defun print-even-odd (list)
  (flet ((even-odd (n)
           (format t "~d: ~s~%" n (if (evenp n) "even" "odd"))))
    (mapcar #'even-odd list)))
