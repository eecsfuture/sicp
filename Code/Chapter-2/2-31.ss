#lang sicp
;#lang racket/base
;(require racket/trace)

(define (square x)
  (* x x))

; using map and recursion
(define (tree-map proc tree)
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (tree-map proc sub-tree)
              (proc sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(square-tree (list 1 (list 2 3)))

