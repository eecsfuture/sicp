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

;value of 1/phi
(/ 1 (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

;recursive version
(define (cont-frac n d k)
  (define (cont-frac-recur a)
    (if (> a k)
      0
      (/ (n a) (+ (d a) (cont-frac-recur (+ a 1))))))
  (cont-frac-recur 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;iter version
(define (cont-frac2 n d k)
  (define (cont-frac-iter counter result)
    (if (= counter 0)
        result
        (cont-frac-iter (- counter 1) (/ (n counter) (+ (d counter) result)))))
  (cont-frac-iter k 0))

(cont-frac2 (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
