;;; make password from the alist of probable spelling

(load "stat-spell.dat") ; *stat-spell* (alist for following characters) is in.

(define (make-eq-hash-table)
  (make-hash-table))

(define (make-eqv-hash-table)
  (make-hash-table))

(define (make-equal-hash-table)
  (make-hash-table))

(define (make-string-hash-table)
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

(define (alist->hash al mode)
  (let ((h (case mode
             ((eq) (make-eq-hash-table))
             ((eqv) (make-eqv-hash-table))
             ((equal) (make-equal-hash-table))
             ((string) (make-string-hash-table)))))
    (for-each (lambda (p)
                (hash-table/put! h (car p) (cdr p)))
              al)
    h))

(define *stat-spell-hash* (alist->hash *stat-spell* 'eqv))

(define (pw-random-select vec)
  (vector-ref vec (random (vector-length vec))))

(define (random00)
  (let loop ((i 0) (acc '()))
    (if (= i 2)
      (list->string acc)
      (loop (1+ i) (cons (pw-random-select '#(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9)) acc)))))

(define (occasional-upcase c)
  (if (< (random 10) 3)
    (char-upcase c)
    c))

(define (pw-enhance ls)
  (list->string
    (map (lambda (c)
           (cond
             ((char=? c #\space)
              (pw-random-select '#(#\- #\_ #\/ #\space #\. #\, #\@ #\? #\( #\))))
             ((char-alphabetic? c)
              (occasional-upcase c))
             (else c)))
         (cdr (reverse! ls)))))

(define (random-following alist)
  (define (sum-weights alist)
    (apply + (map cdr alist)))

  (define (valid-weight? weight)
    (and (number? weight) (>= weight 0)))

  (define (every pred lst)
    (or (null? lst)
        (and (pred (car lst))
             (every pred (cdr lst)))))

  (define (check-alist alist)
    (and (pair? alist)
         (every (lambda (pair)
                  (and (pair? pair)
                       (valid-weight? (cdr pair))))
                alist)))

  (if (check-alist alist)
    (let ((n (random (sum-weights alist))))
      (let loop ((j 0) (alist alist))
        (display "Alist: ")
        (write alist)
        (newline)
        (display "Random n: ")
        (display n)
        (newline)
        (if (pair? alist)
          (let* ((pair (car alist))
                 (weight (cdr pair))
                 (k (+ j weight)))
            (if (> k n)
              (car pair)
              (loop k (cdr alist))))
          (display "Empty list or no valid elements found.\n"))))))

(define (make-pw h n)
  (let loop ((i 0) (c #\space) (acc '()))
    (if (= i n)
      (string-append
        (pw-enhance (cons #\space (cons c acc)))
        (random00))
      (loop (1+ i)
            (let ((next-char (random-following (hash-table/get h c '((#\space . 1))))))
              (if (char? next-char)
                next-char
                #\space))
            (cons c acc)))))

(define (pw-candidates)
  (let loop ((i 0))
    (if (< i 10)
      (begin
        (display i)
        (display ": ")
        (write (make-pw *stat-spell-hash* (+ 9 (random 4))))
        (newline)
        (loop (1+ i)))
      'done)))


