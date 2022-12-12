#lang sicp
;#lang racket/base
;(require racket/trace)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; queens
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board nil)
; (list empty-board)

; (x y) represent row x, col y, has a queen
; col 1 in the right, col k in the left
; (define (adjoin-position new-row k rest-of-queens)
;   (if (null? rest-of-queens)
;       (list (list new-row k))
;       (cons (list new-row k) rest-of-queens)))
(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

; test
; (adjoin-position 1 2 empty-board) ;((1 2))
; (adjoin-position 3 4 (adjoin-position 1 2 empty-board)) ;((3 4) (1 2))

; this solution forget to check the diagonal
; (define (safe? k positions)
;   (let ((k-row (caar positions)))
;        (accumulate
;           (lambda (next rest) (and (not (= k-row (car next))) rest))
;           true
;           (cdr positions))))

; add check for the diagonal
(define (safe? k positions)
  (let ((k-row (caar positions))
        (k-col k))
       (accumulate
          (lambda (next rest) 
            (and (not (= k-row (car next))) ;checks row, do not need to check col
                 (not (= (abs (- k-row (car next))) (abs (- k-col (cadr next)))));checks diag 
                 rest))
          true
          (cdr positions))))

(queens 4)
; (length (queens 8)) ; 92
; (length (queens 11)) ; 2680 
