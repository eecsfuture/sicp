#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; (print-point (make-point 1.0 2.0))

(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define start-p (make-point 1 1))
(define end-p (make-point 3 3))
(define seg (make-segment start-p end-p))
(print-point (start-segment seg))
(print-point (end-segment seg))

(define (midpoint-segment seg)
  (let ((mid-x-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2))
       (mid-y-point (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))
       (make-point mid-x-point mid-y-point)))
(print-point (midpoint-segment seg))