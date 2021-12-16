#lang sicp
;#lang racket/base
;(require racket/trace)

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (compose f (lambda (x) x))
      (compose f (repeated f (- n 1)))))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

;WRONG
(define (smooth-n1 f n)
  (repeated (smooth f) n))

;RIGHT
(define (smooth-n2 f n)
  ((repeated smooth n) f))

(define (square x) (* x x))

((smooth-n1 square 2) 2)
((smooth-n2 square 2) 2)