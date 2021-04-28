#lang racket

(define calc
  (lambda (exp)
    (match exp                                  ; 分支匹配：表达式的两种情况
           [(? number? x) x]                    ; 是数字，直接返回
           [`(,op ,e1 ,e2)                      ; 匹配提取操作符op和两个操作数e1,e2
            (let ([v1 (calc e1)]                ; 递归调用 calc 自己，得到 e1 的值
                  [v2 (calc e2)])               ; 递归调用 calc 自己，得到 e2 的值
              (match op                         ; 分支匹配：操作符 op 的4中情况
                     ['+ (+ v1 v2)]             ; 如果是加号，输出结果为 (+ v1 v2)
                     ['- (- v1 v2)]             ; 如果是减号，乘号，除号，相似的处理
                     ['* (* v1 v2)]
                     ['/ (/ v1 v2)]))])))

(calc '(+ 1 2))
;; => 3
(calc '(* 2 3))
;; => 6
(calc '(* (+ 1 2) (+ 3 4)))
;; => 21
