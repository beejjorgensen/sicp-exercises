(define (square-iter guess prevguess x)
  (if (good-enough? guess prevguess)
    guess
    (square-iter (improve guess x) guess x)))

(define (good-enough? guess prevguess)
  (< (abs (- guess prevguess)) 0.0000000001))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3.0))

(define (square x)
  (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (mycubert x)
  (square-iter 1.0 999.0 x))

(display (mycubert 2.0))
(newline)
