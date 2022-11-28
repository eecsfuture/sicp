#lang sicp
;#lang racket/base
;(require racket/trace)
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
; => (1 2 3 4 5 6)
; because we're just building the list.
; look at the code of append, it's the definition of list
; (cons (car list1) (append (cdr list1) list2))

(cons x y)
; => ((1 2 3) 4 5 6)
; because it's a list of 4 elements, where the first element is also a list. 
; (cons a (list b c d)) is the same as (list a b c d)

(list x y)
; => ((1 2 3) (4 5 6))
; because this is a list of two separate elements
