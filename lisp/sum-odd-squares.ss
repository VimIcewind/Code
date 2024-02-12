(define (sum-odd-squares tree)
  (if (leaf-node? tree)
    (if (odd? tree)
      (squre tree)
      0)
    (+ (sum-odd-squares
         (left-branch tree))
       (sum-odd-squares
         (right-branch tree)))))
