;; -*- lexical-binding: t; -*-

;; (closure ((x . 1)) (y) (* x y))
(setq f
      (let ((x 1))
        (lambda (y) (* x y))))

f

;; 2
(let ((x 2))
  (funcall f 2))

;; 2
(let ((x 3))
  (funcall f 2))

;; 2
(funcall f 2)

