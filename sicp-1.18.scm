; recursive from book
;(define (* a b)
;  (if (= b 0)
;    0
;    (+ a (* a (- b 1)))))

; solution
(define (double a) (* a 2))
(define (halve a) (/ a 2))

; keep the number of a's in a, b, and c invariant
(define (mult a b)
  (define (mult-iter a b c)
    (cond ((= b 0) c)
          ((even? b) (mult-iter (double a) (halve b) c))
          (else (mult-iter a (- b 1) (+ c a)))))
  (mult-iter a b 0))

; test versus actual
(define (test a b)
  (if (not (= (mult a b) (* a b)))
    (begin
      (display a) (display " x ") (display b) (display " = ")
      (display (mult a b))
      (display ", should be: ")
      (display (* a b))
      (newline))))

; Test 12x12 multiplication table
(define (rows y)
  (define (cols x)
    (cond ((< x 13) (test y x) (cols (+ x 1)))))
  (cond ((< y 13) (cols 0) (rows (+ y 1)))))
(rows 0)