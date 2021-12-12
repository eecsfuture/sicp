#lang sicp
;#lang racket/base
;(require racket/trace)

;recursive version
(define (cont-frac n d k)
  (define (cont-frac-recur a)
    (if (> a k)
      0
      (/ (n a) (+ (d a) (cont-frac-recur (+ a 1))))))
  (cont-frac-recur 1))


(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(define pi 3.1415926)
(tan-cf (/ pi 4) 10)
(tan (/ pi 4))