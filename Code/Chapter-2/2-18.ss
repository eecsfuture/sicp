#lang sicp
;#lang racket/base
;(require racket/trace)
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (let ((rest (cdr items)))
    (if (null? rest)
      items
      (append (reverse rest) (list (car items))))))

; ref:http://community.schemewiki.org/?sicp-ex-2.18
; note it has a null? test, and (cons (car items) nil) equal with (list (car items))
(define (reverse2 items) 
  (if (null? (cdr items)) 
      items 
      (append (reverse (cdr items)) 
              (cons (car items) nil)))) 
;; Test
(reverse (list 1 2 3 4 5))
(reverse2 (list 1 2 3 4 5))

