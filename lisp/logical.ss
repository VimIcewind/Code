;; SON-OF ADAM ABEL
;; SON-OF ADAM CAIN
;; SON-OF CAIN ENOCH
;; SON-OF ENOCH IRAD

;; IF (SON-OF ?x ?y) AND
;; (SON-OF ?y ?z)
;; THEN (GRANSON ?x ?z)


;; Here's a procedure that merges two sorted lists

(define (merge x y)
  (cond
    ((null? x) y)
    ((null? y) x)
    (else
      (let ((a (car x)) (b (car y)))
        (if (< a b)
            (cons a
                  (merge (cdr x) y))
            (cons b
                  (merge x (cdr y))))))))

;; (let ((a (car x)) (b (car y)))
;;   (if (< a b)
;;       (cons a (merge (cdr x) y))
;; If
;;   (CDR-X and Y merge-to-form Z)
;; and
;;   A < (car Y)
;; then
;;   ((cons A CDR-X) and Y
;;                merge-to-form (cons A Z))
;; If
;;   (X and CDR-Y merge-to-form Z)
;; and
;;   B < (car X)
;; then
;;   (X and (cons B CDR-Y)
;;                merge-to-form (cons B Z))
;;
;; For all X, (X and () merge-to-form X)
;;
;; For all Y, (() and Y merge-to-form Y)

;; (1 3 7) AND (2 4 8) MERGE-FORM ?

;; (1 3 7) AND ? MERGE-FORM (1 2 3 4 7 8)

;; ?X AND ?Y MERGE-FORM (1 2 3 4 7 8)



(job (Bitdiddle Ben) (computer wizard))

(salary (Bitdiddle Ben) 40000)

(supervisor (Bitdiddle Ben)
            (Warbucks Oliver))

(address (Bitdiddle Ben)
         (Slunerville (Ridge Road) 10))


(address (Hacker Alyssa P)
         (Cambridge (Mass Ave) 78))

(job (Hacker Alyssa P)
     (computer programmer))

(salary (Hacker Alyssa P) 35000)

(supervisor (Hacker Alyssa P)
            (Bitdiddle Ben))

(address (Tweakit Lem E)
         (Boston (Bay State Road) 22))

(job (Tweakit Lem E)
     (computer technician))

(salary (Tweakit Lem E) 15000)

(supervisor (Tweakit Lem E)
            (Bitdiddle Ben))

(address (Reasoner Louis)
         (Slunerville (Pine Tree Road)
                      80))

(job (Reasoner Louis)
     (computer programmer trainee))

(salary (Reasoner Louis) 20000)

(supervisor (Reasoner Louis)
            (Hacker Alyssa P))

(job (Warbucks Oliver)
     (administration big wheel))

(salary (Warbucks Oliver) 100000)

(address (Warbucks Oliver)
         (Swelleley (The Manor)))


;; PRIMITIVES
;; MEANS OF COMBINATION
;; MEANS OF ABSTRACTION

(job ?x (computer programmer))

matches

(job (Hacker Alyssa P)
     (computer programmer))



(job ?x (computer ?type))

matches

(job (Bitdiddle Ben) (computer wizard))

(job (Hacker Alyssa P)
     (computer programmer))

(job (Tweakit Lem E)
     (computer technician))


(job ?x (computer ?type))

doesn't match

(job (Reasoner Louis)
     (computer programmer trainee))


(job ?x (computer . ?type))

matches

(job (Reasoner Louis)
     (computer programmer trainee))




;;


(job ?x (computer . ?y))


(supervisor ?x ?y)

(address ?x (Cambridge . ?t))


;; List all people who work in the computer
;; division, together with their supervisor.
(and (job ?x (computer . ?y))
     (supervisor ?x ?z))


;; List all People whose salary is greater
;; than 30000.
(and (salary ?p ?a)
     (lisp-value > ?a 30000))


;; List all people who work in the computer
;; division. who do not have a supervisor
;; who works in the computer division.
(and
  (job ?x (compter . ?y))
  (not (and (supervisor ?x ?z)
            (job ?z (compter . ?w)))))


;; Rules as a means abstraction
(rule
  (bigshot ?x ?dept)
  (and
    (job ?x (?dept . ?y))
    (not (and (supervisor ?x ?z)
              (job ?z (?dept . ?w))))))



(rule (merge-to-form () ?y ?y))

(rule (merge-to-form ?y () ?y))


(rule
  (merge-to-form
    (?a . ?x) (?b .?y) (?b .?z))
  (and (merge-to-form (?a . ?x) ?y ?z)
       (lisp-value > ?a ?b)))

(rule
  (merge-to-form
    (?a . ?x) (?b .?y) (?b .?z))
  (and (merge-to-form ?x (?b . ?y) ?z)
       (lisp-value > ?b ?a)))




;;

(merge-to-form (1 3) (2 7) ?x)

(merge-to-form (2 ?a) ?x (1 2 3 4))

(merge-to-form ?x ?y (1 2 3 4 5))


;; SAMPLE PATERNS

(a ?x c)

(job ?x (computer ?y))

(job ?x (computer .? y))

(a ?x ?x)

(?x ?y ?y ?x)

(a . ?x)


(match pat data dictionary)

;; x=a -> x=a y=b
(?x ?y ?y ?x)
(a b b a)

;; y=a -> FAIL
(?x ?y ?y ?x)
(a b b a)


;; PRIMITIVES
;; Query

(job ?x (?d . ?y))

(and (job ?x (?d . ?y)) (supervisor ?x ?z))


;; COMBINATION
;; and or not

;; ABSTRACTION

(rule (boss ?z ?d)
    (and (job ?x (?d . ?y))
         (supervisor ?x ?z)))


(boss (Bitdiddle Ben) computer)

(boss ?who computer)



unify       (?x ?x)

with  ((a ?y c) (a b ?z))

        ?x : (a b c)
        ?y : b
        ?z : c


unify       (?x ?x)

with    ((?y a ?w) (b ?v ?z))

        ?y : b
        ?v : a
        ?w : ?z
        ?x : (b a ?w)


unify       (?x ?x)

with    (?y (a . ?y))

        ?x : ?y
        ?y : (a a a ...)



;; (and p q)
;; (and q p)


;; (or p q)
;; (or q p)


(rule (outranked-by ?s ?b)
  (or (supervisor ?s ?b)
      (and (supervisor ?s ?m)
           (outranked-by ?m ?b))))

(rule (outranked-by ?s ?b)
  (or (supervisor ?s ?b)
      (and (outranked-by ?m ?b)
           (supervisor ?s ?m))))



;; ALL HUMANS ARE MORTAL
;; ALL GREEKS ARE HUMAN
;; Socrares is a GREEKS
;; Socrares is MORTAL

(Greek Socrates)  (Greek Plato)
(Greek Zeus)      (god Zeus)

(rule (mortal ?x) (human ?x))
(rule (fallible ?x) (human ?x))

(rule (human ?x)
    (and (Greek ?x) (not (god ?x))))

(rule (address ?x Olympus)
    (and (Greek ?x) (god ?x)))


(rule (perfect ?x)
      (and (not mortal ?x))
      (not (fallible ?x)))

(and (address ?x ?y)
     (perfect ?x))

(and (perfect ?x)
     (address ?x ?y))


(not (mortal zeus))
(not (fallible zeus))
