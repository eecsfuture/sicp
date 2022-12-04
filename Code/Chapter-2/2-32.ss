#lang sicp
;#lang racket/base
;(require racket/trace)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (items) (cons (car s) items)) rest)))))

(subsets (list 1 2 3))

; (append (subsets (2 3)) (map (1) (subsets (2 3))))
; (subsets (2 3)) -> (append (subsets (3)) (map (2) (subsets (3))))
; (subsets (3)) -> (append (subsets '()) (map (3) '()))

;; Explanation
; First, as a clue and guess, the missing part <??> must be the combination of (car s),
; if not, the information of (car s) is missing
; Second, it is a wishful thingking method, the "rest" part has been already the subsets of (cdr s), 
; it is all subsets without (car s), so, the "map" part has to be subsets must include (car s)
; these two parts are the whole subsets of s
; some kind like the counting change example
