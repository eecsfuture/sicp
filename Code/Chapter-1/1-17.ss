;#lang sicp
#lang racket/base
(require racket/trace)
(define (double x) (+ x x))
(define (halve x)
        (if (even? x)
            (/ x 2)
            (display "Error: x is not even")))
(define (fast-multi a b)
  (cond
    ((= b 1) a)
    ((even? b) (fast-multi (double a) (halve b)))
    (else (+ a (fast-multi a (- b 1))))))

(trace fast-multi)
(fast-multi 5 10)


(define (fast-multi2 a b)
  (cond
    ((= b 1) a)
    ((even? b) (double(fast-multi2 a (halve b))))
    (else (+ a (fast-multi2 a (- b 1))))))

(trace fast-multi2)
(fast-multi2 5 10)

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(trace *)
(* 5 10)