#lang sicp
;#lang racket/base
;(require racket/trace)
(define (f g) (g 2))
(f (lambda (x) (* x x)))
(f f)

;The trace for the evaluation of (f f) will be:

;(f f)
;(f 2)
;(2 2)
; Error: 2 is not a procedure
;  application: not a procedure;
;  expected a procedure that can be applied to arguments
;  given: 2
