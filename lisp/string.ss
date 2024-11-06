(define s "abc")
(display s)
(newline)

(string? s)

(make-string 2)
(make-string 2 #\a)

(string-length s)

(string=? s s)
(string=? "abcd" "abcd")

(string-ref s 0)
(string-ref s 1)
(string-ref s 2)

(string-set! s 0 #\A)
(display s)
(newline)

(substring s 1 2)
(substring "abcdefg" 1 4)

(string-append "Chez" "Scheme")

(string->list s)

(list->string '(#\a #\b #\c))

(string-copy s)
