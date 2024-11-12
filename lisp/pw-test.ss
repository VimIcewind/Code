(compile-file "stat-spell.ss")
(load "stat-spell.so")

;;; creating spelling data according to sicp_foreword.txt
(ss-make-dat "sicp_foreword.txt")

(compile-file "make-pw.ss")
(load "make-pw.so")

;;; make ten passwords using the spelling data.
(pw-candidates)
