#lang sicp
;#lang racket/base
;(require racket/trace)
; ref:http://community.schemewiki.org/?sicp-ex-2.6
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; Define One
(add-1 zero)
(lambda (f) (lambda (x) (f ((zero f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
(lambda (f) (lambda (x) (f x)))

(define one
  (lambda (f) (lambda (x) (f x))))

;; Define Two
(add-1 one)
(lambda (f) (lambda (x) (f ((one f) x))))
(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
(lambda (f) (lambda (x) (f (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

;; Define addition
 (define (add a b) 
   (lambda (f) 
     (lambda (x) 
       ((a f) ((b f) x))))) 

; If you wonder how to use these functions here are few examples
(define (square x) (* x x))
((zero square) 2)
((one square) 2)
((two square) 2)
(((add two one) square) 2)

;; substitution
((zero square) 2)
(((lambda (f) (lambda (x) x)) square) 2)
((lambda (x) x) 2)
2

((one square) 2)
(((lambda (f) (lambda (x) (f x))) square) 2)
((lambda (x) (square x))  2)
(square 2)
4

((two square) 2)
(square (square 2))
16