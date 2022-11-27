#lang sicp
;#lang racket/base
;(require racket/trace)
(define a (list 1 3 (list 5 7) 9))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdaddr a))
(caar b)
(cadadr (cadadr (cadadr c)))
