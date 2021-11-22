(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))
computing (base (* 2 exp) m) using expmod above requirs twice steps of (base exp m)
because of the expicit multiplicaton, so its a theta(n) process.
