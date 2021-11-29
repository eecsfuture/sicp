#lang sicp
;#lang racket/base
;(require racket/trace)

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate filter combiner null-value term (next a) next b))
          (filtered-accumulate filter combiner null-value term (next a) next b))))
;; prime?
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x) (* x x))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-square-prime a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-square-prime 1 5)


;; gcd
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identify x) x)

(define (product-prime-to-n n)
  (define (gcd-n a)
    (= (gcd a n) 1))
  (filtered-accumulate gcd-n * 1 identify 1 inc n))

(product-prime-to-n 10)