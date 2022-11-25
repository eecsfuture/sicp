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
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
;; width
(define (width interval)
  (/ (- (upper-bound interval) (lower-bound interval)) 2.0))

;; width of add
;    (width (add-interval x y))
; => (/ (- (upper-bound (add-interval x y)) (lower-bound (add-interval x y))) 2)
; => (/ (- (+ (upper-bound x) (upper-bound y)) (+ (lower-bound x) (lower-bound y))) 2)
; => (/ (+ (- (upper-bound x) (lower-bound x)) (- (upper-bound y) (lower-bound y))) 2)
; => (+ (width x) (width y))

;; same with sub
;    (width (sub-interval x y))
; => (+ (width x) (width y)) ;; notice this is "add", not "sub"

;; test
(define x (make-interval 1.0 2.0))
(define y (make-interval 3.0 6.0))
(width x)
(width y)

(newline)
(display "add")
(newline)
(width (add-interval x y))
(+ (width x) (width y))

(newline)
(display "sub")
(newline)
(width (sub-interval x y))
(+ (width x) (width y))

;ref；http://community.schemewiki.org/?sicp-ex-2.9
;For multiplication and division, the story is different.
;If the width of the result was a function of the widths of the inputs,
;then multiplying different intervals with the same widths should give the same answer. 
(newline)
(display "mul")
(newline)
(width (mul-interval x y))
(* (width x) (width y))

(newline)
(display "div")
(newline)
(width (div-interval x y))
(/ (width x) (width y))

;The following intervals have the same widths as the corresponding ones above,
;but multiplying gives different results:
(define x2 (make-interval 4.0 5.0))
(define y2 (make-interval 7.0 10.0))
(width x2)
(width y2)

(newline)
(display "mul")
(newline)
(width (mul-interval x2 y2))
(* (width x2) (width y2))

(newline)
(display "div")
(newline)
(width (div-interval x2 y2))
(/ (width x2) (width y2))