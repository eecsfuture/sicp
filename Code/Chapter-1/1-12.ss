; Rows(n) start from 0, counting from above; columns(m) start from 0 too, counting from left to right.
; where m must <= n
(define (f n m)
  (cond ((= m 0) 1)
        ((= m n) 1)
        (else (+ 
               (f (- n 1) (- m 1))
               (f (- n 1) m)))))