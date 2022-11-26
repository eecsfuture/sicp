#lang sicp
;#lang racket/base
;(require racket/trace)
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair items)
  (let ((n (length items)))
    (list (list-ref items (- n 1)))))

;; Test
(last-pair (list 23 72 149 34))

