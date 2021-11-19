#lang sicp
;#lang racket/base
;(require racket/trace)

(define (iter-fast-expt b n)
  (define (expt-iter b n a) 
    (cond ((= n 0) a)
          ((even? n) (expt-iter (square b) (/ n 2) a))
          (else (expt-iter b (- n 1) (* b a)))))
  (expt-iter b n 1))

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

;(trace iter-fast-expt)
(iter-fast-expt 2 10)