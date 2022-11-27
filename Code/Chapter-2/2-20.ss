#lang sicp
;#lang racket/base
;(require racket/trace)
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (same-even-odd? a b)
  (= (remainder a 2) (remainder b 2)))

(define (same-parity a . z)
  (define (iter first remain result)
    (if (null? remain)
        result
        (iter first
              (cdr remain)
              (if (same-even-odd? first (car remain))
                  (append result (list (car remain)))
                  result))))
  (iter a z (list a)))

;; Test
; (same-even-odd? 1 3)
; (same-even-odd? 1 2)
(same-parity 1)
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
