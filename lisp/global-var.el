(defun foo ()
  (setq bar 3)
  (message (format "%d" bar)))

(foo)
(message "%d" bar)
