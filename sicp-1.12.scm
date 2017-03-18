; Compute Pascal's triangle
;
; row,col:
;
;    0  1  2  3  4  5
;  +-----------------
; 0| 1
; 1| 1  1
; 2| 1  2  1
; 3| 1  3  3  1
; 4| 1  4  6  4  1
; 5| 1  5 10 10  5  1

(define (pascals row col)
  (cond ((and (= row 0) (= col 0)) 1)
        ((or (< col 0) (> col row) (< row 0)) 0)
        (else
          (+ (pascals (- row 1 ) (- col 1)) (pascals (- row 1) col)))))

; Print out the triangle
(define (printpascal)

  (define (rows i)

    (define (cols j)
      (cond ((or (< j i) (= j i))
        (display (pascals i j))
          (display " ")
          (cols (+ j 1)))
        (else (newline))))

    (if (< i 17)
      (begin (cols 0)
        (rows (+ i 1)))))

  (rows 0))

(printpascal)
