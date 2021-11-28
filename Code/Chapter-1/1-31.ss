#lang sicp
;#lang racket/base
;(require racket/trace)
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial-recur n)
  (define (identical x) x)
  (define (inc x) (+ x 1))
  (product identical 1 inc n))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial-iter n)
  (define (identical x) x)
  (define (inc x) (+ x 1))
  (product-iter identical 1 inc n))

(factorial-recur 5)
(factorial-iter 5)

(define (pi-product a b)
  (define (pi-term n)
    (/ (* 4 n (+ n 1))
       (* (+ (* 2 n) 1) (+ (* 2 n) 1))))
  (product-iter pi-term a inc b))

(* 4 (pi-product 1.0 10000000))