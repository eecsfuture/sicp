#lang sicp
;#lang racket/base
;(require racket/trace)

(define (expmod1 base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod1 base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod1 base (- exp 1) m))
                    m))))        

(define (square x) (* x x))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (timed-expmod base exp m select)
  (newline)
  (display select)
  (start-expmod base exp m select (runtime)))

(define (start-expmod base exp m select start-time)
  (if (= select 1)
      (expmod1 base exp m)
      (expmod2 base exp m))
  (report-prime (- (runtime) start-time)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-expmod 2 50 506 1)
(timed-expmod 2 500 506 1)
(timed-expmod 2 5000 506 1)
(timed-expmod 2 50000 506 1)
(timed-expmod 2 500000 506 1)
(timed-expmod 2 5000000 506 1)

(timed-expmod 2 50 506 2)
(timed-expmod 2 500 506 2)
(timed-expmod 2 5000 506 2)
(timed-expmod 2 50000 506 2)
(timed-expmod 2 500000 506 2)
(timed-expmod 2 5000000 506 2)
