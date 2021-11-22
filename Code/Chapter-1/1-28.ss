#lang sicp
;#lang racket/base
;(require racket/trace)

(define (square x) (* x x))

(define (remainder-square-check x m)
  (if (and (not(= x 1))
           (not(= x (- m 1)))
           (= (remainder (square x) m) 1))
      (begin
        (display "m: ")
        (display m)
        (newline)
        (display "x: ")
        (display x)
        (newline)
        (display "not passed miller-rabin test")
        (newline)
        0)
      (remainder (square x) m)))

(define (expmod-check base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder-square-check (expmod-check base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod-check base (- exp 1) m))
                    m))))

(define (miller-rabin-test n times)
  (display "left times: ")
  (display times)
  (newline)
  (define (try-it a)
    (display "a: ")
    (display a)
    (newline)
    (= (expmod-check a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n times)
         (begin
          ;(display "left times: ")
          ;(display times)
          (miller-rabin-prime? n (- times 1))))
        (else
          (begin
            ;(display "times: ")
            ;(display times)
            ;(newline)
            false))))

(miller-rabin-prime? 561 20)
(miller-rabin-prime? 6601 20)
(miller-rabin-prime? 1000037 20)