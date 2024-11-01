(define (write-file file-name str)
  (let ((p (open-output-file file-name)))
    (write str p)
    (close-output-port p)
    ))

(write-file "hi.txt" "Hi, ChezScheme!")
