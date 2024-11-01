(define (write-file file-name str)
  (call-with-output-file file-name
                         (lambda (p)
                           (write str p))))

(write-file "hi.txt" "Hi, ChezScheme!")
