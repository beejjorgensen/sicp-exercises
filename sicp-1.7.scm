#!/usr/bin/guile
!#

(define (good-enough? y prevy)
  (< (/ (abs (- y prevy)) y) 0.0000001))

(define (guess x y prevy)
  (if (good-enough? y prevy)
    y
    (guess x (/ (+ y (/ x y)) 2) y)))

(define (nsqrt x)
  (guess x 1.0 2.0))

(define (test x)
  (begin
    (display (nsqrt x))
    (display " ")
    (display (sqrt x))
    (newline)))

(test 2)
(test 9)
(test 121)
(test 3490)
(test 13490)
(test 0.01)
