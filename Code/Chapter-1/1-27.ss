#lang sicp

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))      

(define (full-fermat-test n)
  (define (iter a n)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (iter (+ a 1) n))
          (else false)))
  (iter 1 n))

(define (fool-fermat-test n)
  (display n)
   (if (full-fermat-test n)
      (display " pass fermat test")
      (display " not pass fermat test"))
  (newline)
  (display n)
  (if (prime? n)
      (display "  is a prime number")
      (display "  is not a prime number"))
  (newline))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square x) (* x x))


(fool-fermat-test 561)
(fool-fermat-test 1729)
(fool-fermat-test 6601)
(fool-fermat-test 1000037)