#lang sicp
;#lang racket/base
;(require racket/trace)

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product v w)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init sequence) 
  (define nil '()) 
  (if (null? (car sequence)) 
      nil 
      (cons (accumulate op init (map car sequence)) 
            (accumulate-n op init (map cdr sequence))))) 


; test
(dot-product (list 1 2 3 4) (list 2 2 2 2))
(define m (list (list 1 2 3 4) (list 4 5 6 7) (list 6 7 8 9)))
(define v (list 2 2 2 2))
(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m (transpose m))
