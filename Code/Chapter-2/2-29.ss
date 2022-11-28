#lang sicp
;#lang racket/base
;(require racket/trace)

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; part a
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;; test a
(define b1 (make-branch 16 4))
(define b2 (make-branch 3 5))
(define b3 (make-branch 5 3))
(define m1 (make-mobile b2 b3))
(define b4 (make-branch 5 m1))
(define m2 (make-mobile b1 b4))

; (left-branch m1)
; (right-branch m1)

; (newline)
; (left-branch m2)
; (right-branch m2)

; (branch-length b1)
; (branch-structure b1)

; (branch-length b4)
; (branch-structure b4)

;; part b
; test wether a mobile is the end mobile, which means it doesn't have any submobiles
(define (end-mobiles? m)
  (and (pair? m) (not (pair? (car m))) (not (pair? (car (cdr m)))) (null? (cdr (cdr m)))))

(define (total-weight m)
  (cond ((not (pair? m)) 0)
        ((end-mobiles? m) (branch-structure m))
        (else (+ (total-weight (left-branch m))
                 (total-weight (right-branch m))))))

;; test b
(newline)
(total-weight m2)
; (left-branch m2)
; (right-branch m2)

; (newline)
; (left-branch (right-branch m2))
; (right-branch (right-branch m2))

; (newline)
; (left-branch (right-branch (right-branch m2)))
; (right-branch (right-branch (right-branch m2)))
; (cdr (cdr (right-branch m2)))

;; part c
(define (total-length m)
  (cond ((not (pair? m)) 0)
        ((end-mobiles? m) (branch-length m))
        (else (+ (total-length (left-branch m))
                 (total-length (right-branch m))))))

(define (torque m)
  (* (total-length m) (total-weight m)))

; like (right-branch m2) => (5 ((3 5) (5 3)))
; this type of branch should not consider as submobile
(define (structure-branch m)
  (and (pair? m) (not (pair? (car m))) (pair? (car (cdr m))) (null? (cdr (cdr m)))))

(define (balenced? m)
  (cond ((and (not (end-mobiles? m)) (not (structure-branch m))) ; submobiles
          (and (= (torque (left-branch m)) (torque (right-branch m)))
               (balenced? (left-branch m))
               (balenced? (right-branch m))))
        (else #t)))

;; test c
; (total-length m2)
(balenced? m2) ; #f
; (torque (left-branch m2))
; (torque (right-branch m2))
; (end-mobiles? (left-branch m2))
; (right-branch m2)
; (end-mobiles? (right-branch m2))
; (torque (left-branch (right-branch m2)))
; (torque (right-branch (right-branch m2)))

;; test d
; (define (make-mobile left right)
;   (cons left right))

; (define (make-branch length structure)
;   (cons length structure))

; (define (left-branch mobile)
;   (car mobile))

; (define (right-branch mobile)
;   (cdr mobile))

; (define (branch-length branch)
;   (car branch))

; (define (branch-structure branch)
;   (cdr branch))
