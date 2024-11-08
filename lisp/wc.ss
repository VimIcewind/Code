;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;     wc.ss
;;;     a scheme word-count program
;;;
;;;      by T.Shido
;;;      on August 19, 2005
;;;      modified by VimIcewind
;;;      on November 8, 2024
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list->symbol ls0)
  (string->symbol (list->string (reverse! ls0))))

(define (char-in c . ls)
  (let loop((ls0 ls))
    (if (null? ls0)
      #f
      (or (char=? c (car ls0))
          (loop (cdr ls0))))))

(define (read-words fname)
  (with-input-from-file fname
    (lambda ()
      (let loop((w '()) (wls '()))
        (let ((c (read-char)))
          (cond
            ((eof-object? c)
             (reverse! (if (pair? w)
                        (cons (list->symbol w) wls)
                        wls)))
            ((char-in c #\space #\linefeed #\tab #\, #\. #\ #\( #\) #\= #\? #\! #\; #\:)
             (loop '() (if (pair? w)
                         (cons (list->symbol w) wls)
                         wls)))
            (else
              (loop (cons (char-downcase c) w) wls))))))))

(define (sort-by-frequency al)
  (sort (lambda (x y) (> (cadr x) (cadr y))) al))

(define (make-eq-hash-table)
  (make-hash-table))

(define (hash-table/get table key n)
  (hashtable-ref table key n))

(define (hash-table/put! table key value)
  (hashtable-set! table key value))

(define (hash-table->alist ht)
  (let loop ((keys (vector->list (hashtable-keys ht)))
             (result '()))
    (if (null? keys)
      result
      (let* ((key (car keys))
             (value (hashtable-ref ht key #f)))
        (loop (cdr keys) (cons (list key value) result))))))

(define (wc fname)
  (let ((wh (make-eq-hash-table)))
    (let loop((ls (read-words fname)))
      (if (null? ls)
        (sort-by-frequency (hash-table->alist wh))
        (begin
          (hash-table/put! wh (car ls) (1+ (hash-table/get wh (car ls) 0)))
          (loop (cdr ls)))))))

(wc "wc.ss")


