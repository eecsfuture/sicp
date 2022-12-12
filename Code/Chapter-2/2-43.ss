#lang sicp
;#lang racket/base
;(require racket/trace)

;; Louis's version of queens
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
	 ;; next expression changed
         (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                    (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

; Louis's version, for every new-row in (enumerate-interval 1 board-size),
; it has to calculate one time of (queen-cols (- k 1))
; On the contrast, the original version (Exercise 2.42) only need to calculate one (queen-cols (- k 1)),
; for all the new-rows in (enumerate-interval 1 board-size)

; assu ming that the program in Exercise 2.42 solves the puzzle in time T
; original version: T(n)=nT(n-1)=n*(n-1)*T(n-2)=n!T(1)
; Louis's version: T(n)=nT(n-1)=n*nT(n-2)=n^nT(1)
; note that in the Louis's version, every round the parameter of flatmap is board-size, that is n
; So the Louis's version's consuming time is approximately n^n times than the original versi
