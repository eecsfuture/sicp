(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

; (define (sqrt-iter guess x)
;   (new-if (good-enough? guess x)
;           guess
;           (sqrt-iter (improve guess x)
;                      x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)  ;; because the 3 parameters are evaluated before the cond is called
  (cond (predicate then-clause)
        (else else-clause)))

(sqrt 9)

;; combine the new-if and sqrt-iter to the code below, will work without problem
(define (sqrt-iter guess x)
  (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))))


;; other materials from http://community.schemewiki.org/?sicp-ex-1.6
The default if statement is a special form which means that even when an interpreter follows applicative substitution, it only evaluates one of its parameters- not both. However, the newly created new-if doesn't have this property and hence, it never stops calling itself due to the third parameter passed to it in sqrt-iter.

To be even clearer: The act of re-defining a special form using generic arguments effectively "De-Special Forms" it. It then becomes subject to applicative-order evaluation, such that any expressions within the consequent or alternate portions are evaluated regardless of the predicate. In Ex 1.6, the iteration procedure is called without return and eventually overflows the stack causing an out of memory error.

 (define (iff <p> <c> <a>) (if <p> <c> <a>)) 
  
 (define (tryif a) (if (= a 0) 1 (/ 1 0))) 
  
 (define (tryiff a) (iff (= a 0) 1 (/ 1 0))) 
Welcome to DrRacket, version 7.5 [3m].
Language: R5RS; memory limit: 128 MB.
> (tryif 0)
1
> (tryif 1)
. . /: division by zero
> (tryiff 0)
. . /: division by zero
> (tryiff 1)
. . /: division by zero
> 

;; some of my test code
(define (try x)
  (cond ((= x 0) 1)
        (else (/ 1 0)))) ;; in this case, else clause is NOT evaluate at first

> (try 0)
1
> (try 1)
Exception in /: undefined for 0
Type (debug) to enter the debugger.

(define (try a b)
  (cond ((> a 0) a)
        (else (/ a 0))))

> (try 1 (/ 1 1))
1
> (try -1 (/ 1 1))
Exception in /: undefined for 0
Type (debug) to enter the debugger.
> (try 1 (/ 1 0))  ;; because (1 / 0), the second parameter to try, is evaluated before the try is even called. 
Exception in /: undefined for 0
Type (debug) to enter the debugger.

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause))) ;; in this case, else clause IS evaluate at first

> (new-if (= 1 1) (+ 1 1) (/ 1 
0))
Exception in /: undefined for 0
Type (debug) to enter the debugger.