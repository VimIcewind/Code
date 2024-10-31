(cons 1 2)
(pair? (cons 1 2))

(list 1 2 3)
(list? (list 1 2 3))

(list)
(null? (list))

(symbol? pi)
(define pi 3.141592653589793238462643383279)
(symbol? pi)
(symbol? 'pi)

#\a
(char? #\a)

"Hi, ChezScheme!"
(string? "Hi, ChezScheme!")

3
(number? 3)
3.14
(number? 3.14)
3/4
(number? 3/4)
1+2i
(number? 1+2i)

3+4i
(complex? 3+4i)

3.14
(real? 3.14)

1/3
(rational? 1/3)

3
(integer? 3)

4
(exact? 4)

3.14
(inexact? 3.14)

