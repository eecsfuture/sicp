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

(define (d i)
  (cond ((= i 1) 1)
        ((= i 2) 2)
        ((= i 3) 1)
        ((= i 4) 1)
        ((= (remainder (- i 2) 3) 0) (* 2 (+ (/ (- i 2) 3) 1)))
        (else 1)))

(define (show-d k)
  (if (= k 0)
      (display "end")
      (begin
        (display "k=" )(display k )(display " and " )
        (display "Dk=" )
        (let ((result (d k)))
          (display result))
        (newline)
        (show-d (- k 1)))))

;(show-d 10)

(+ 2
   (cont-frac (lambda (x) 1.0)
              d
              20))