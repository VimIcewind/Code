(define x 'A)
(symbol? x)
(symbol? 'Hello)

(string->symbol "X")

(eq? (string->symbol "Hello") 'Hello)

(eq? (string->symbol "Hello") (string->symbol "Hello"))

(symbol->string 'Hello)
(symbol->string (string->symbol "Hello"))
