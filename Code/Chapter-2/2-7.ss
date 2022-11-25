#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-intercal a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (cdr interval) (cdr interval)))

;; test
(upper-bound (make-intercal 0.5 2.5))
(lower-bound (make-intercal 3.5 2.4))