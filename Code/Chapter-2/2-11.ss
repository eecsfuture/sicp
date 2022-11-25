#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

;; add
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
;; sub
(define (sub-interval x y)
  (add-interval
    x
    (make-interval (- (upper-bound y))
                   (- (lower-bound y)))))
;; mul
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

;; div
(define (div-interval x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
      (display "Error: divide by an interval that spans zero")
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

;; test
(define x (make-interval 1.0 2.0))
(define y (make-interval -1.0 6.0))

(newline)
(display "add")
(newline)
(add-interval x y)

(newline)
(display "sub")
(newline)
(sub-interval x y)

(newline)
(display "mul")
(newline)
(mul-interval x y)

(newline)
(display "div")
(newline)
(div-interval x y)
