; Compute nth Fibonacci number
(define (fib n)
  (define (fib-iter a b m)
    (cond ((= m 1) a)
          (else (fib-iter (+ a b) a (- m 1)))))

  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (fib-iter 1 0 n))))

; Show Fibonacci numbers from 0..n-1
(define (fibs n)
  (define (fibsup m)
    (cond ((< m n)
            (display "fib(")
            (display m)
            (display ") = ")
            (display (fib m))
            (newline)
            (fibsup (+ m 1)))
          (else #f)))
  (fibsup 0))

; Main
(fibs 100)
     