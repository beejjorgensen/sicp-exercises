#!/usr/bin/guile
!#

; A function f is defined by the rule that
;    f(n) = n for n<3 
;    f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) for n>=3.

; Recursive process
(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

; Iterative process
(define (fi n)
  (define (fi-iter count m1 m2 m3)
    (let ((cur (+ m1 (* 2 m2) (* 3 m3))))
      (if (< count n)
        (fi-iter (+ 1 count) cur m1 m2)
        cur)))

  (if (< n 3)
    n
    (fi-iter 3 2 1 0)))

; Print out comparison of both functions
(define (fcompare c)
  (display "fi(") (display c) (display ") = ") (display (fi c)) (display ", ")
  (display "f(") (display c) (display ") = ") (display (f c)) (newline)

  (if (< c 30)
    (fcompare (+ c 1))))

(fcompare 0)