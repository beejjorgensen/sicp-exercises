(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (fast-expt (square b) (/ n 2)))
        (else (* b (fast-expt b (- n 1))))))

(define (square x) (* x x))


; http://www.billthelizard.com/2010/01/sicp-exercise-116-fast-exponentiation.html

(define (fast-expt-iter b n)
  (define (fei-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fei-iter (square b) (/ n 2) a))  ; b^n == (b^2)^(n/2), so therefore a cannot change
          (else (fei-iter b (- n 1) (* a b)))))        ; b^n == (b^(n-1))*b, so we must move that b over to a

  (fei-iter b n 1))
    
(define (showexpt b n)
  (display b)
  (display "^")
  (display n)
  (display " = ")
  (display (fast-expt-iter b n))
  ;(display (fast-expt b n))
  (display ", actual: ")
  (display (expt b n))
  (newline))

(showexpt 0 0) 
(showexpt 0 10)
(showexpt 1 0)
(showexpt 1 10)
(showexpt 1 2)
(showexpt 2 2)
(showexpt 2 4)
(showexpt 2 9)
(showexpt 5 10)
(showexpt 5 11)
(showexpt 12 12)
(showexpt 12 13)