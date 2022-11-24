#lang sicp
;#lang racket/base
;(require racket/trace)
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (cal-how-many-x-in-z z x counter)
  (if (= (remainder z x) 0)
    (cal-how-many-x-in-z (/ z x) x (+ counter 1))
    counter))

(define (car z)
  (cal-how-many-x-in-z z 2 0))
  
(define (cdr z)
  (cal-how-many-x-in-z z 3 0))

;; test
(cons 5 10)
(car (cons 5 10))
(cdr (cons 2 33))
