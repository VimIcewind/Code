(define (s-read file-name)
  (with-input-from-file file-name
                        (lambda ()
                          (let loop((ls1 '()) (s (read)))
                            (if (eof-object? s)
                              (reverse ls1)
                              (loop (cons s ls1) (read)))))))

(s-read "read.ss")
