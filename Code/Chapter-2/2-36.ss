#lang sicp
;#lang racket/base
;(require racket/trace)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (exclude-list-ref items n)
  (if (= n 0)
      (cdr items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (all-the-first-elements-of-seqs seqs)
  (let ((num-of-lists (length seqs)))
        (define (ex-seqs items n)
          (if (= n num-of-lists)
          nil
          (cons (list-ref (list-ref items n) 0) (ex-seqs items (+ n 1)))))
        (ex-seqs seqs 0)))

; (list-ref (list-ref items n) 0) => (car (list-ref items n))

(define (exclude-all-first-elements-of-seqs seqs)
  (let ((num-of-lists (length seqs)))
        (define (ex-seqs items n)
          (if (= n num-of-lists)
          nil
          (cons (cdr (list-ref items n)) (ex-seqs items (+ n 1)))))
        (ex-seqs seqs 0)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (all-the-first-elements-of-seqs seqs))
            (accumulate-n op init (exclude-all-first-elements-of-seqs seqs)))))

; ref:http://community.schemewiki.org/?sicp-ex-2.36
; (all-the-first-elements-of-seqs seqs) => (map car sequence)
; (exclude-all-first-elements-of-seqs seqs) => (map cdr sequence)
; (define (accumulate-n op init sequence) 
;   (define nil '()) 
;   (if (null? (car sequence)) 
;       nil 
;       (cons (accumulate op init (map car sequence)) 
;             (accumulate-n op init (map cdr sequence))))) 


; test
(define seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
; (all-the-first-elements-of-seqs seqs)
; (exclude-all-first-elements-of-seqs seqs)
(accumulate-n + 0 seqs)

