#lang sicp
;#lang racket/base
;(require racket/trace)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display "x=") (display guess) (display "and f(x)=") (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))



(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

(define (average a b) (/ (+ a b) 2))
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)