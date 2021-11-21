#lang sicp
;#lang racket/base
;(require racket/trace)

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes a b)
  (if (not (even? a))
      (if (prime? a)
          (timed-prime-test a)))
  (if (not (> a b))
      (search-for-primes (+ a 1) b)))

(define (search-for-primes-count start num)
  (if (> num 0)
      (if (prime? start)
       (begin
         (timed-prime-test start)
         (search-for-primes-count (+ start 1) (- num 1)))
       (search-for-primes-count (+ start 1) num))
       (begin
         (newline)
         (display "---DONE---"))))

;(timed-prime-test 251)
;(timed-prime-test 409)
;(search-for-primes 100 1000)
(search-for-primes-count 1000 3)
(search-for-primes-count 10000 3)
(search-for-primes-count 100000 3)
(search-for-primes-count 10000000000 10)