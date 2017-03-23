(define (smallest-divisor n)
  (define (sd-loop x)
    (cond ((> (* x x) n) n)
          ((= (remainder n x) 0) x)
          (else (sd-loop (+ x 1)))))
  (sd-loop 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (testprimes n max)
  (cond ((< n max)
          (cond ((prime? n)
          (display n)
          (newline)))
          (testprimes (+ n 1) max))))

(testprimes 100000000 101000000)
