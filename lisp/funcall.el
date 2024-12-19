(defun a (x) (+ x 1))
(a 1)
(funcall 'a 1)

(setq b (lambda (x) (+ x 2)))
(funcall b 2)


(setq foo (lambda (name)
            (message "Hello, %s!" name)))
;; error
(foo "Tom")

;; Hello, Tom!
(funcall foo "Tom")

;; Hello, Tom!
((lambda (name)
   (message "Hello, %s!" name))
 "Tom")

