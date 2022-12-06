#lang sicp
;#lang racket/base
;(require racket/trace)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

; count-leaves defined by accumulate
(define (count-leaves-acc t)
  (accumulate (lambda (x y) (+ 1 y)) 0 (map (lambda (x) x) (enumerate-tree t))))

; (lambda (x) x) return x itself
; not (lambda (x) (x)) this will evaluate x and output error
; application: not a procedure;
;  expected a procedure that can be applied to arguments
;   given: 1
; or use (define (identity x) x)
; see in page 92

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves-acc x)

(list x x)
(count-leaves (list x x))
(count-leaves-acc (list x x))

(enumerate-tree x)
(enumerate-tree (list x x))

; method that don't use enumerate-tree
; ref:http://community.schemewiki.org/?sicp-ex-2.35
 (define (count-leaves-recursive t) 
   (accumulate + 0 
     (map 
       (lambda (t) 
         (cond ((null? t) 0) 
               ((pair? t) (count-leaves-recursive t)) 
               (else 1))) 
       t))) 

;; which gives 
(count-leaves-recursive '(1 2 () () (3 () ()))) 
;; Value: 3 

