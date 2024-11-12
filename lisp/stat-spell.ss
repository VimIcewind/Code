;;; make an alist of probable spelling from a given English text

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

(define (char-graphic? char)
    (and (not (char=? char #\space))
                (not (char-control? char))))

(define (char-control? char)
    (let ((code (char->integer char)))
          (or (< code 32) (= code 127))))

(define (skip-char? c)
  (or (not (char-graphic? c)) (memv c '(#\: #\; #\' #\" #\`))))

(define (ss-make-alist c alist)
  (let ((p (assv c alist)))
    (if p
      (begin
        (set-cdr! p (1+ (cdr p)))
        alist)
      (cons (cons c 1) alist))))

(define (ss-make-dat filename)
  (let ((char-hash (make-eqv-hash-table)))
    (with-input-from-file filename
      (lambda ()
        (let loop ((c #\space))
          (let ((c1 (read-char)))
            (if (not (eof-object? c1))
              (if (skip-char? c1)
                (loop c)
                (let ((c1 (char-downcase c1)))
                  (hash-table/put! char-hash c
                                   (ss-make-alist c1 (hash-table/get char-hash c '())))
                  (loop c1))))))))
    (with-output-to-file "stat-spell.dat"
      (lambda ()
        (display "(define *stat-spell* \'(")
        (newline)
        (let loop ((alst (sort (lambda (x y) (char<? (car x) (car y)))
                               (hash-table->alist char-hash))))
          (if (pair? alst)
            (begin
              (write (car alst))
              (newline)
              (loop (cdr alst)))))
        (display "))")
        (newline)))))
