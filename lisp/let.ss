(let ((a 1) (b 2))
  (+ a b))

((lambda (a b)
   (+ a b))
 1 2)

(let ((i 1) (j 2))
  (+ i j))

(let ((i 1))
  (let ((j (+ i 2)))
    (* i j)))


;; Exception: variable i is not bound
(let ((i 1) (j (+ i 2)))
  (* i j))


(let* ((i 1) (j (+ i 2)))
  (* i j))

