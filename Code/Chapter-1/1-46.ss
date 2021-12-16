#lang sicp
;#lang racket/base
;(require racket/trace)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? improve) (improve guess)))))

;sqrt
(define (square x) (* x x))
(define (sqrt x)
  ((iterative-improve
     (lambda (guess) (< (abs (- (square guess) x)) 0.001))
     (lambda (guess) (* 0.5 (+ guess (/ x guess)))))
  1.0))

(sqrt 2)

;fixed-point
(define tolerance 0.00001)
(define (fixed-point f guess)
  ((iterative-improve
    (lambda (guess) (< (abs (- (f guess) guess)) tolerance))
    (lambda (guess) (f guess)))
   1.0))

(fixed-point cos 1.0)