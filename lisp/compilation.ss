;; Register Operations in interpreting (F X)

; (assign unev (operands (fetch exp)))
; (assign exp (operator (fetch exp)))
; (save continue)
; (save env)
; (save unev)
; (assign continue eval-args)
; (assign val (lookup-var-val (fetch exp) (fetch env)))
; (restore unev)
; (restore env)
; (assign fun (fetch val))
; (save fun)
; (assign argl '())
; (save argl)
; (assign exp (first-operand (fetch unev)))
; (assign continue accumulate-last-arg)
; (assign val (lookup-var-val (fetch exp) (fetch env)))
;



;; (IF P A B)
; <CODE FOR P -- RESULT IN VAL>
; BRANCH IF VAL IS TRUE TO LABEL1
; <CODE FOR B>
; GOTO NEXT THING
; LABEL1 <CODE FOR A>
; GOTO NEXT THING

; (save env)
; (assign val (lookup-var-val 'f (fetch env)))
; (restore env)
; (assign fun (fetch val))
; (save fun)
; (assign argl '())
; (save argl)
; (assign val (lookup-var-val 'x (fetch env)))
; (restore argl)
; (assign argl (cons (fetch val) (fetch argl)))
; (restore fun)
;



;; Eliminating unnecessary stack operations
; (assign fun (lookup-var-val 'f (fetch env)))
; (assign val (lookup-var-val 'x (fetch env)))
; (assign argl (cons (fetch val) '()))
;; computation proceeeds at apply-dispatch




(F (G x) 1)



(OP A1 A2)

; {COMPIEL OP; RESULT IN FUN} ;; PRESERVING ENV

; {COMPIEL A; RESULT IN VAL}            ;; PRES ENV              ;; PRESERVING FUN
; (assgin ARGL (CONS (FETCH VAL) '()))

; {COMIPLE A2; RESULT IN VAL}                    ;; PRES ARGL
; (assign ARGL (CONS (FETCH VAL) (FETCH ARGL)))

; (GOTO APPLY-DISPATCH)

;; APPEND SEQ1 TO SEQ2 PRESERVING REG

;; IF SEQ1 needs REG
;; AND SEQ1 MODIFIES REG
; (SAVE REG)
;; <SEQ1>
; (RESTORE REG)
;; <SEQ2>

;; OTHERWISE
;; <SEQ1>
;; <SEQ2>
