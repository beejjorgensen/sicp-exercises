(define (smallest-divisor n)
  (define (sd-loop x)
    (cond ((> (* x x) n) n)
          ((= (remainder n x) 0) x)
          (else (sd-loop (+ x 2)))))
  (sd-loop 2))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (testprimes n)
  (cond ((< n 30)
          (cond ((prime? n)
          (display n)
          (newline)))
          (testprimes (+ n 1)))))

(testprimes 0)
