#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

;; test
(upper-bound (make-interval 0.5 2.5))
(lower-bound (make-interval 3.5 2.4))