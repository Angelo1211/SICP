#lang sicp

#|
; Ex. 1.5
(define (p) (p))

(define (test x y)
        (if (= x 0)
         0
         y))

; This causes an infinite loop, which proves this is an applicative order execution
; It causes and infinite loop because you have defined (p) to be equal to (p) which
; In applicative order will get expanded ad infinitum while in normal-order evaluation
; You'll actually expand to 0 before that
(test 0 (p))

; Ex. 1.4
; We can change the operation applied to the data based on the result of the data!
(define (a-plus-abs-b a b) 
        ((if (> b 0) + -) a b))
(a-plus-abs-b 1 2)  ; 3
(a-plus-abs-b 1 -2) ; 3
(a-plus-abs-b -1 -2)  ; 3

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
; 29
(sum-square-largest-pair 2 1 5)

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
