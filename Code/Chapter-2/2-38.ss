#lang sicp
;#lang racket/base
;(require racket/trace)
; accumulate
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

; fold-left
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
(fold-left / 1 (list 1 2 3))
(fold-right list nil (list 1 2 3))
(fold-left list nil (list 1 2 3))

(fold-right * 1 (list 1 2 3))
(fold-left * 1 (list 1 2 3))
(fold-right + 0 (list 1 2 3))
(fold-left + 0 (list 1 2 3))
(fold-right - 0 (list 1 2 3))
(fold-left - 0 (list 1 2 3))

;; Property 1: Commutative
; op should satisfy the commutative law, that property guarantee that
; fold-right and fold-left will produce the same values for any sequence.

; In mathematics, a binary operation is commutative
; if changing the order of the operands does not change the result. 

; another explaination from ref:http://community.schemewiki.org/?sicp-ex-2.38
;Now consider a special case sequence only contains one element,
; so sequence = [x1], then fold-left will get (op init x1) and fold-right will get (op x1 init),
; for these two to be equal, op must be commutative.

;; Property 2: Associative
; (fold-right + 3 (list 1 2)) => (+ 1 (+2 3)) => (2 + 3) + 1
; (fold-left + 3 (list 1 2)) => (+ (+ 3 1) 2) => (3 + 1) + 2
; (3 + 1) + 2
; = 2 + (3 + 1) commutative
; = (2 + 3) + 1 associative
