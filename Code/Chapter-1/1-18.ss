;#lang sicp
#lang racket/base
(require racket/trace)
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (iter-fast-multi a b c)
  (cond
    ((= b 0) c)
    ((even? b) (iter-fast-multi (double a) (halve b) c))
    (else (iter-fast-multi a (- b 1) (+ a c)))))

(trace iter-fast-multi)
(iter-fast-multi 1 15 0)

