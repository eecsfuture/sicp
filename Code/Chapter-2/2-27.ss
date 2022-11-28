#lang sicp
;#lang racket/base
;(require racket/trace)
(define (reverse items)
  (if (null? items)
    items
    (append (reverse (cdr items)) (list (car items)))))

;; This solution works with Test1, but not works with Test2
; (define (deep-reverse items)
;   (cond ((null? (cdr items)) (list (reverse (car items))))
;         (else (append (deep-reverse (cdr items)) (deep-reverse (list (car items)))))))

;; Another slluton works with both Tests
;; ref http://community.schemewiki.org/?sicp-ex-2.27
(define (deep-reverse items)
  (if (pair? items)
      (append (deep-reverse (cdr items)) (list (deep-reverse (car items))))
      items))

;; Test1
(define x (list (list 1 2) (list 3 4)))
x
(reverse x)
(deep-reverse x)

;; Test2
(define z (cons (list 1 2) (list 3 4)))
z
(reverse z)
(deep-reverse z)

;; explore the characteristic of car & cdr on a list
; > (define x (list 3 4))
; > (car x)
; 3
; > (pair? x)
; #t
; > (pair? (cdr x))
; #t
; > (null? (car x))
; #f
; > (null? (cdr x))
; #f
; > (null? (cdr (cdr x)))
; #t

; (define x (list (list 1 2) (list 3 4)))
; > x
; ((1 2) (3 4))
; (append (cdr x) (list (car x)))
; ((3 4) (1 2))
; (cdr x)
; ((3 4))
; (list (car x))
; ((1 2))

; > (define z (cons (list 1 2) (list 3 4)))
; > z
; ((1 2) 3 4)
; > (car z)
; (1 2)
; > (cdr z)
; (3 4)
; > (list (car z))
; ((1 2))


