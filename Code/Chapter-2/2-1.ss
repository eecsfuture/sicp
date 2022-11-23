#lang sicp
;#lang racket/base
;(require racket/trace)
;(define (make-rat n d) (cons n d))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (if (or (and (> n 0) (< d 0)) (and (< n 0) (< d 0)))
        (let ((n-new (- n))
              (d-new (- d))
              (g (gcd (abs n) (abs d))))
             (cons (/ n-new g) (/ d-new g)))
        (let ((g (gcd (abs n) (abs d))))
          (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 6 9)) ; 2/3 
(print-rat (make-rat -6 9)) ; -2/3 
(print-rat (make-rat 6 -9)) ; -2/3 
(print-rat (make-rat -6 -9)) ; 2/3