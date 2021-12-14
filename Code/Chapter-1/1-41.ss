#lang sicp
;#lang racket/base
;(require racket/trace)

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 0)
(((double (double double)) inc) 0)
((double (double inc)) 0)
(((double double) inc) 0)