#lang sicp

(define (square x) (* x x))

(square 5)
(square (square 3))
(define (sum-of-squares x y) (+ square(x) square(y) ))


; Chapter 1 examples
;(define pi 3.14159)
;(define radius 10)
;(* pi (* radius radius))
;(define circumference(* 2 pi radius))
;circumference


