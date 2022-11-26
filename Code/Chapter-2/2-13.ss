#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

(define (make-center-percent c p)
  (let ((width (* c (/ p 100))))
    (make-interval (- c width) (+ c width))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2))
       (center (/ (+ (lower-bound i) (upper-bound i)) 2)))
  ( * (/ width center) 100)))


;; mul
; (x px) * (y py) assume px's and py's unit are %
; upper-bound -> x(1+px)*y(1+py) -> xy(1+px+py+px*py)
; because px and py are very small, px*py is approximate to zero, so it can be ignore
; so, upper-bound -> xy(1+px+py)
; same here, lower-bound -> xy(1-px-py)
(define (mul-interval x y)
  (make-center-percent (* (center x) (center y)) (+ (percent x) (percent y))))

;; Test
(define a (make-center-percent 3.5 4.2857))
(lower-bound a)
(upper-bound a)
(center a)
(percent a)
(newline)

(define b (make-center-percent 1.5 1.1))
(lower-bound b)
(upper-bound b)
(center b)
(percent b)
(newline)

(define c (mul-interval a b))
(lower-bound c)
(upper-bound c)
(center c)
(percent c)
