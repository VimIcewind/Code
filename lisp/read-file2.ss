(define (read-file file-name)
  (with-input-from-file file-name
                        (lambda ()
                          (let loop((ls1 '()) (c (read-char)))
                            (if (eof-object? c)
                              (list->string (reverse ls1))
                              (loop (cons c ls1) (read-char)))))))

(display (read-file "read-file2.ss"))
