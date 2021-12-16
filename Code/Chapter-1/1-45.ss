#lang sicp
;#lang racket/base
;(require racket/trace)

;average-damp
(define (average a b) (* 0.5 (+ a b)))
(define (average-damp f)
  (lambda (x) (average x (f x))))

;fixed-point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;repeated
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (compose f (lambda (x) x))
      (compose f (repeated f (- n 1)))))

;2th-root
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))
(sqrt 2)

;3th-root
(define (square x) (* x x))
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(cube-root 2)

;4th-root
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (4th-root x)
  (fixed-point (average-damp (average-damp (lambda (y) (/ x (fast-expt y 3)))))
               1.0))

(4th-root 2)

;8th-root
(define (8th-root x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (fast-expt y 7))))))
               1.0))

(8th-root 2)

;15th-root
(define (15th-root x)
  (fixed-point (average-damp (average-damp (average-damp (lambda (y) (/ x (fast-expt y 14))))))
               1.0))

(15th-root 2)

;n-th-root
(define (n-th-root n x)
  (fixed-point ((repeated average-damp (floor (log n 2)))
                (lambda (y) (/ x (fast-expt y (- n 1)))))
                1.0))
(newline)
(n-th-root 2 2)
(n-th-root 3 2)
(n-th-root 4 2)
(n-th-root 8 2)
(n-th-root 15 2)





