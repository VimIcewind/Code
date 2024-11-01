(define (write-file file-name str)
  (with-output-to-file file-name
                         (lambda ()
                           (write str))))

(write-file "hi.txt" "Hi, ChezScheme!")
