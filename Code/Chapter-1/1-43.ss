#lang sicp
;#lang racket/base
;(require racket/trace)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (compose f (lambda (x) x))
      (compose f (repeated f (- n 1)))))

(define (square x) (* x x))
((repeated square 2) 5)

((repeated (lambda (x) (* x x)) 2) 5)
