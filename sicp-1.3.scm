#!/usr/bin/guile
!#
(define (larger-sos a b c)
  (if (and (< a b) (< a c))
    (+ (* b b) (* c c))
    (if (and (< b a) (< b c))
      (+ (* a a) (* c c))
      (+ (* a a) (* b b)))))
      
(define (assert msg a b)
  (if (not (= a b))
    (begin
      (display msg)
      (display " != ")
      (display b)
      (newline))))

(assert "1 2 3" (larger-sos 1 2 3) 13)
(assert "2 1 3" (larger-sos 2 1 3) 13)
(assert "2 3 1" (larger-sos 2 3 1) 13)

