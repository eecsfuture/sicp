#lang sicp
;#lang racket/base
;(require racket/trace)

;; square-list1
(define (square-list1 items)
  (if (null? items)
    nil
    (cons (square (car items)) (square-list1 (cdr items)))))

(define (square x)
  (* x x))

(square-list1 (list 1 2 3 4))

;; square-list2
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

(square-list2 (list 1 2 3 4))

