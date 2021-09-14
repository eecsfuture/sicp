(define (sum-of-square x y)
  (+ (* x x) (* y y)))

(define (f a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-square b c))
        ((and (<= b a) (<= b c)) (sum-of-square a c))
        ((and (<= c a) (<= c b)) (sum-of-square a b))))

(f 2 3 4)
(f 2 2 4)