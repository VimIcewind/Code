;; define λ as lambda
(define-syntax λ (syntax-rules () ((_ param body ...) (lambda param body ...))))

(λ(y) ((λ(x) (* x y)) 3))
;; =
(λ(y) ((λ(z) (* z y)) 3))

;; Free Variables y
(λ(x) (* x y))

(λ(y) ((λ(x) (* x y)) 3))
