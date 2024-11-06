(define bank-account
  (let ((balance 10))
    (lambda (n)
      (set! balance (+ balance n))
      balance)))

(bank-account 20)

(bank-account -25)


(define (make-bank-account balance)
  (lambda (n)
    (set! balance (+ balance n))
    balance))

(define gates-bank-account (make-bank-account 10))
(gates-bank-account 50)
(gates-bank-account -55)

(define torvalds-bank-account (make-bank-account 100))
(torvalds-bank-account -70)
(torvalds-bank-account 300)
