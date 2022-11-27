#lang sicp
;#lang racket/base
;(require racket/trace)
(define (for-each proc items)
  (if (not (null? items))
      (proc (car items))
      )
  (if (not (null? items))
      (for-each proc (cdr items)))
      )

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))
