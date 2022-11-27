#lang sicp
;#lang racket/base
;(require racket/trace)

; (define (square-list items)
;   (define (iter things answer)
;     (if (null? things)
;         answer
;         (iter (cdr things) 
;               (cons (square (car things))
;                     answer))))
;   (iter items nil))

; the above calculate can expand like this:
; > (cons 1 '())
; (1)
; > (cons 4 (cons 1 '()))
; (4 1)
; > (cons 9 (cons 4 (cons 1 '())))
; (9 4 1)
; > (cons 16 (cons 9 (cons 4 (cons 1 '()))))
; (16 9 4 1)
; the reason why it dosn't have a nested form of cons is this is the way that "list" defined
; see page 139

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(define (square x)
  (* x x))

(square-list (list 1 2 3 4))

; the second answer get a nested list form
; > (cons '() 1)
; (() . 1)
; > (cons (cons '() 1) 4)
; ((() . 1) . 4)
; > (cons (cons (cons '() 1) 4) 9)
; (((() . 1) . 4) . 9)
; > (cons (cons (cons (cons '() 1) 4) 9) 16)
; ((((() . 1) . 4) . 9) . 16)

