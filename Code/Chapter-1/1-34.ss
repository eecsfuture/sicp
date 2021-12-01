#lang sicp
;#lang racket/base
;(require racket/trace)
(define (f g) (g 2))
(f (lambda (x) (* x x)))
(f f)