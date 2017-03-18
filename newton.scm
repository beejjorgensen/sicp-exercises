(define (square-iter guess x)
  (if (good-enough? guess x)
    guess
    (square-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.0000000001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (mysqrt x)
  (square-iter 1.0 x))

(display "mysqrt(2.0): ")
(display (mysqrt 2.0))
(newline)

(display "  sqrt(2.0): ")
(display (sqrt 2.0))
(newline)
