#lang sicp
;#lang racket/base
;(require racket/trace)
; a better solution than mine, which used the selectors to ensure make a data-abstraction barrier
; ref:http://community.schemewiki.org/?sicp-ex-2.29

 (define (make-mobile left right) 
   (list left right)) 
 (define (left-branch mobile) 
   (car mobile)) 
 (define (right-branch mobile) 
   (car (cdr mobile))) 
  
 (define (make-branch length structure) 
   (list length structure)) 
  
 (define (branch-length branch) 
   (car branch)) 
 (define (branch-structure branch) 
   (car (cdr branch))) 

 (define (total-weight mobile) 
   (cond ((null? mobile) 0) 
         ((not (pair? mobile)) mobile) 
         (else (+ (total-weight (branch-structure (left-branch mobile))) 
                  (total-weight (branch-structure (right-branch mobile))))))) 

 (define a (make-mobile (make-branch 2 3) (make-branch 2 3))) 
 (total-weight a)
 (define d (make-mobile (make-branch 10 a) (make-branch 12 5))) 
 (total-weight d)
(branch-structure (left-branch d))
(branch-structure (right-branch d))

 (define (torque branch) 
   (* (branch-length branch) (total-weight (branch-structure branch)))) 

(define (balanced? mobile) 
   (if (not (pair? mobile)) 
       true
       (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile)))))) 

(balanced? d)
