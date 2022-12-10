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

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

; generates pairs (i,j,k) with 1 <= k < j < i <= n
; (define (unique-triple-pairs n)
;   (flatmap
;       (lambda (i)
;         (map (lambda (j)
;               (map (lambda (k) (list i j k))
;                   (enumerate-interval 1 (- j 1))))
;               (enumerate-interval 1 (- i 1))))
;       (enumerate-interval 1 n)))

(define (unique-triple-pairs n)
  (flatmap
      (lambda (i)
        (flatmap (lambda (j)
                    (map (lambda (k) (list i j k))
                         (enumerate-interval 1 (- j 1))))
              (enumerate-interval 1 (- i 1))))
      (enumerate-interval 1 n)))

(define (triple-pairs-equal-s? s t)
  (= (+ (car t) (cadr t) (caddr t)) s))

(define (triples-less-n-eqaul-s n s)
  (filter (lambda (t) (triple-pairs-equal-s? s t)) (unique-triple-pairs n)))

;; test
(unique-triple-pairs 6)
(newline)
(triples-less-n-eqaul-s 6 9)
