#lang sicp
;#lang racket/base
;(require racket/trace)

;; Point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; Segment
(define (make-segment start end) (cons start end))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (midpoint-segment seg)
  (let ((mid-x-point (/ (+ (x-point (start-segment seg)) (x-point (end-segment seg))) 2))
       (mid-y-point (/ (+ (y-point (start-segment seg)) (y-point (end-segment seg))) 2)))
       (make-point mid-x-point mid-y-point)))

;; Rectangle representation 1 Using Segment of x axle and Segment of y axle
; (define (make-rectangle x-axle-seg y-axle-seg) (cons x-axle-seg y-axle-seg))
; (define (x-axle-seg-of-rect rect) (car rect))
; (define (y-axle-seg-of-rect rect) (cdr rect))

;; Rectangle representation 2 Using Origin Point and Diagonal Point
(define (make-rectangle origin-point diagonal-point) (cons origin-point diagonal-point))
(define (x-axle-seg-of-rect rect)
  (make-segment (car rect)
                (make-point (x-point (cdr rect)) (y-point (car rect)))))

(define (y-axle-seg-of-rect rect)
  (make-segment (car rect)
                (make-point (x-point (car rect)) (y-point (cdr rect)))))

;; Perimeter of Rectangle
; square
(define (square x) (* x x))
;average-damp
(define (average a b) (* 0.5 (+ a b)))
(define (average-damp f)
  (lambda (x) (average x (f x))))
; fixed-point
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
; sqrt
(define (sqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))
; length-of-seg
(define (length-of-seg seg)
  (sqrt (+
          (square (abs (- (x-point (start-segment seg)) (x-point (end-segment seg)))))
          (square (abs (- (y-point (start-segment seg)) (y-point (end-segment seg))))))))
(define (perimeter rect)
  (* 2 (+ (length-of-seg (x-axle-seg-of-rect rect)) (length-of-seg (y-axle-seg-of-rect rect)))))
;; Area of Rectangle
(define (area rect)
  (* (length-of-seg (x-axle-seg-of-rect rect)) (length-of-seg (y-axle-seg-of-rect rect))))

;; Test of representation 1
; (define start-p (make-point 1 1))
; (define x-end-p (make-point 4 1))
; (define y-end-p (make-point 1 5))
; (define x-seg (make-segment start-p x-end-p))
; (define y-seg (make-segment start-p y-end-p))
; (define rect (make-rectangle x-seg y-seg))
; (perimeter rect)
; (area rect)

;; Test of representation 2
(define origin-p (make-point 1 1))
(define diagonal-p (make-point 4 5))
(define rect (make-rectangle origin-p diagonal-p))
(perimeter rect)
(area rect)