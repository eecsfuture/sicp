#lang sicp
;#lang racket/base
;(require racket/trace)
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 2 3))
(car a)
(cdr a)

;; substitution model
;==> (car a)
;==>(a (lambda (p q) p))
;==>( (lambda (m) (m 2 3)) (lambda (p q) p))
;==>((lambda (p q) p) 2 3)
;==>2