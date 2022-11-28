#lang sicp
;#lang racket/base
;(require racket/trace)

(define (fringe items)
  (cond ((null? items) nil)
        ((pair? items) (append (fringe (car items)) (fringe (cdr items))))
        (else (list items))))

;; Test
(define x (list (list 1 2) (list 3 4)))
(fringe x)
(fringe (list x x))
