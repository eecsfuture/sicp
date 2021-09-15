(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 0.0000001))

(define (square x) (* x x))

;change initial guess to 1.1 to prevent an anomalous result for 
;cube root of -2 
(define (cube x)
  (cube-iter 1.1 x))

(cube -2)
(cube 27)
(cube 0.0)