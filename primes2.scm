(define (square x) (* x x))

; Compute base^exp mod m
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m)) m))
        (else
          (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (ft a) (= a (expmod a n n)))
  (if (< n 2)
      #t
      (ft (+ 1 (random (- n 1))))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))


(define (testprimes n max)
  (cond ((< n max)
          (cond ((fast-prime? n 8)
          (display n)
          (newline)))
          (testprimes (+ n 1) max))))

(testprimes 100000000 101000000)