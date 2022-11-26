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

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

;; Test
(define r1 (make-interval 3.9 4.1))
(define r2 (make-interval 5.8 6.2))

; (lower-bound (par1 r1 r1))
; (upper-bound (par1 r1 r1))
; (newline)

; (lower-bound (par2 r1 r1))
; (upper-bound (par2 r1 r1))
; (newline)

; (lower-bound (par1 r1 r2))
; (upper-bound (par1 r1 r2))
; (newline)

; (lower-bound (par2 r1 r2))
; (upper-bound (par2 r1 r2))
; (newline)

(div-interval r1 r1)
(newline)
(div-interval r1 r2)
(newline)

;; center-percent form
(define (make-center-percent c p)
  (let ((width (* c (/ p 100))))
    (make-interval (- c width) (+ c width))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (percent i)
  (let ((width (/ (- (upper-bound i) (lower-bound i)) 2))
       (center (/ (+ (lower-bound i) (upper-bound i)) 2)))
  ( * (/ width center) 100)))

; ;; Test
(define r3 (make-center-percent 4 0))
(define r4 (make-center-percent 4 0.1))

; (lower-bound (par1 r3 r3))
; (upper-bound (par1 r3 r3))
; (center (par1 r3 r3))
; (percent (par1 r3 r3))
; (newline)

; (lower-bound (par2 r3 r3))
; (upper-bound (par2 r3 r3))
; (center (par2 r3 r3))
; (percent (par2 r3 r3))
; (newline)

; (lower-bound (par1 r3 r4))
; (upper-bound (par1 r3 r4))
; (center (par1 r3 r4))
; (percent (par1 r3 r4))
; (newline)

; (lower-bound (par2 r3 r4))
; (upper-bound (par2 r3 r4))
; (center (par2 r3 r4))
; (percent (par2 r3 r4))
; (newline)

(div-interval r3 r3)
(newline)
(div-interval r3 r4)
(newline)

; ref:http://community.schemewiki.org/?sicp-ex-2.14-2.15-2.16
; 2.14. Lem just demonstrates the above.
; 2.15. Eva is right, since the error isn't reintroduced into the result in par2 as it is in par1.

; ref:https://stackoverflow.com/questions/14130878/sicp-2-16-interval-arithmetic-scheme/14131196#14131196
; 2.16. Is it possible to create an arithmetic package which does not have this problem?
; No, since not every function can be written where every variable appears only once. 
; This problem is known as the dependency problem.
