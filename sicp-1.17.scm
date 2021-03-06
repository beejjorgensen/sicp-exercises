; recursive from book
;(define (* a b)
;  (if (= b 0)
;    0
;    (+ a (* a (- b 1)))))

; solution
(define (double a) (* a 2))
(define (halve a) (/ a 2))

; solution
(define (mult a b)
  (cond ((= b 0) 0)
        ((even? b) (mult (* 2 a) (/ b 2)))
        (else (+ a (mult a (- b 1))))))

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