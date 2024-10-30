#!r6rs

; scheme --script top-level-programs.ss filename
(import (rnrs base)
        (rnrs io ports)
        (rnrs programs))
(let ((p (standard-output-port)))
  (put-bytevector p
                  (call-with-port
                    (open-file-input-port
                      (cadr (command-line)))
                    get-bytevector-all))
  (close-port p))
