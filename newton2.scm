(define (mysqrt x)

  (define (square-iter guess)
    (if (good-enough? guess)
      guess
      (square-iter (improve guess))))

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.0000000001))

  (define (improve guess)
    (average guess (/ x guess)))

  (square-iter 1.0))

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(display "mysqrt(2.0): ")
(display (mysqrt 2.0))
(newline)

(display "  sqrt(2.0): ")
(display (sqrt 2.0))
(newline)
