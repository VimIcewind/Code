(+ 1 3)

(+ 1 (call-with-current-continuation
       (lambda (escape)
         (+ 2 (escape 3)))))


(define (find-first lst pred)
  (let loop ((lst lst))
    (if (null? lst)
      #f  ; 如果列表为空，则返回 false
      (let ((x (car lst)))
        (if (pred x)
          x  ; 如果找到符合条件的元素则返回该元素
          (loop (cdr lst)))))))

; 使用 call/cc 实现提前退出
(define (find-first-cc lst pred)
  (call-with-current-continuation
    (lambda (exit)  ; exit 是一个可以用来立即终止搜索的函数
      (let loop ((lst lst))
        (if (null? lst)
          (exit #f)  ; 没有找到匹配项时退出
          (let ((x (car lst)))
            (if (pred x)
              (exit x)  ; 找到了匹配项后立即返回
              (loop (cdr lst)))))))))

;; 测试
(find-first '(1 2 3 4 5) even?)  ;; 返回 2
(find-first-cc '(1 2 3 4 5) even?)  ;; 返回 2

