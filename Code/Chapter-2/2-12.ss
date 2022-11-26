#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (make-center-percent c p)
  (make-interval (* c (/ (- 100 p) 100)) (* c (/ (+ 100 p) 100))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  ( * (/ (/ (- (upper-bound i) (lower-bound i)) 2) (/ (+ (lower-bound i) (upper-bound i)) 2)) 100))

;; Test

(define a (make-center-percent 3.5 4.2857))
(lower-bound a)
(upper-bound a)
(center a)
(percent a)
