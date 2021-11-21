#lang sicp
;#lang racket/base
;(require racket/trace)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (square x) (* x x))


(define (prime? n)
  (fast-prime? n 20))

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
(search-for-primes-count 10000 5)
(search-for-primes-count 100000000 5)