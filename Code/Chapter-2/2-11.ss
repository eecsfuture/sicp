#lang sicp
;#lang racket/base
;(require racket/trace)
(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval) (cdr interval)))

(define (lower-bound interval)
  (min (car interval) (cdr interval)))

;; mul
(define (mul-interval x y)
  (let ((lx (lower-bound x))
        (ux (upper-bound x))
        (ly (lower-bound y))
        (uy (upper-bound y)))
    (cond ((and (< ux 0) (< uy 0)) ;case 1
            (make-interval (* ux uy) (* lx ly)))
          ((and (< ux 0) (<= (* uy ly) 0)) ;case 2
            (make-interval (* lx uy) (* lx ly)))
          ((and (< ux 0) (> ly 0)) ;case 3
            (make-interval (* lx uy) (* ux ly)))
          ((and (<= (* ux lx) 0) (< uy 0))  ;case 4
            (make-interval (* ux ly) (* lx ly)))
          ((and (<= (* ux lx) 0) (<= (* uy ly) 0)) ;case 5
            (make-interval (min (* lx uy) (* ux ly)) (* ux uy)))
          ((and (<= (* ux lx) 0) (> ly 0)) ;case 6
            (make-interval (* lx uy) (* ux uy)))
          ((and (> lx 0) (< uy 0)) (make-interval (* ux ly) (* lx uy))) ;case 7
          ((and (> lx 0) (<= (* uy ly) 0)) (make-interval (* ux ly) (* ux uy))) ;case 8
          ((and (> lx 0) (> ly 0)) (make-interval (* lx ly) (* ux uy)))))) ;case 9

;; test
(define x (make-interval -3 2))
(define y (make-interval -4 3))

(newline)
(display "mul")
(newline)
(mul-interval x y)

