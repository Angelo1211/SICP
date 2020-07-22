#lang sicp

; Exercise 1.3
(define (square x) (* x x))
(define (sum-of-squares  x y) (+ (square x) (square y)))
(define (return-largest  x y) (if (>= x y) x y))
(define (return-smallest x y) (if (< x y) x y))

(define (sum-square-largest-pair x y z)
        (sum-of-squares (return-largest x y) (return-largest (return-smallest x y) z)))

; 13
(sum-square-largest-pair 1 2 3)

; 109
(sum-square-largest-pair 10 2 3)

; 0
(sum-square-largest-pair 0 0 0)

; 13
(sum-square-largest-pair 3 2 1)

; 5
(sum-square-largest-pair 1 1 2)

; 5
(sum-square-largest-pair 1 2 1)

#|
; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

; Exercise 1.1
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
    (+ a 1))
|#
