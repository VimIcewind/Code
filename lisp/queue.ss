(define (make-queue)
  (cons '() '()))

(define (enqueue! queue obj)
  (let ((lobj (cons obj '())))
    (if (null? (car queue))
      (begin
        (set-car! queue lobj)
        (set-cdr! queue lobj))
      (begin
        (set-cdr! (cdr queue) lobj)
        (set-cdr! queue lobj)))
    (car queue)))

(define (dequeue! queue)
  (let ((obj (car (car queue))))
    (set-car! queue (cdr (car queue)))
    obj))

(define q (make-queue))

(enqueue! q 'a)

(enqueue! q 'b)

(enqueue! q 'c)

(dequeue! q)

q

