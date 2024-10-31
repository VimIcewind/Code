; #t
(= 1 1 1.0)
; #t
(< 1 2 3)
; #t
(< 1)

;;(<)

; #t
(= 2 2 2)
; #t
(< 2 3 3.1)
; #t
(> 4 1 -0.2)
(<= 1 1 1.1)
; #t
(>= 2 1 1.0)
; #f
(< 3 4 3.9)

; #t
(odd? 1)
; #f
(odd? 2)

; #f
(even? 1)
; #t
(even? 2)


; #t
(positive? 1)
; #f
(positive? -1)
; #f
(negative? 1)
; #t
(negative? -1)

; #t
(zero? 0)
; #f
(zero? 1)

; #t
(char=? #\a #\a)
; #t
(char<? #\a #\b)
; #f
(char>? #\a #\b)
; #t
(char<=? #\a #\b)
; #f
(char>=? #\a #\b)

; #t
(string=? "hello" "hello")
; #t
(string-ci=? "Hello" "hello")
