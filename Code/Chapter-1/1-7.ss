(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; (define (good-enough? guess x)
;   (< (abs (- guess (improve guess x))) 0.0000001))

;iterates until guess and next guess are equal, 
;automatically produces answer to limit of system precision 
(define (good-enough? guess x) 
   (= (improve guess x) guess)) 

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 100000000000000000)
(sqrt 0.0000000000000001)
(sqrt 0.0)