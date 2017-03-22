; Needed help on this one:
; http://www.billthelizard.com/2010/01/sicp-exercise-119-computing-fibonacci.htm

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))


(define (fibber n)
  (define (fibber-iter count)
    (cond ((< count n)
            (display (fib count))
            (display " ")
            (fibber-iter (+ count 1)))))
  (fibber-iter 0)
  (newline))

(fibber 15)
