; sqrt(10) = 3.162277
;
; With function prime?
;
; actual   predicted
; ------   ---------
;  0.5         -
;  0.15      0.16
;  0.48      0.47
;  1.52      1.52

; From SICP section 1.2.6
(define (smallest-divisor n)
  (define (sd-loop x)
    (cond ((> (* x x) n) n)
          ((= (remainder n x) 0) x)
          (else (sd-loop (+ x 1)))))
  (sd-loop 2))

(define (prime? n)
  (= (smallest-divisor n) n))

; Definition of runtime for Guile from
; http://community.schemewiki.org/?SICP
(define (runtime) (tms:clock (times)))

; From SICP, modified a bit
(define (timed-prime-test n)
  ;(newline) ; removed
  ;(display n) ; removed
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f)) ; added
(define (report-prime n elapsed-time)
  (display n) ; added
  (display " *** ")
  (display (/ elapsed-time 1000000000.0)) ; get down to seconds
  (display " s") ; added
  (newline) ; added
  #t) ; added, return true if we had a prime

; 1.22
; This deliberately and inefficiently checks evens
; to help measure runtime.
(define (search-for-primes start)
  (define (sfp-inner n count)
    (if (< count 3)
      (if (timed-prime-test n)
        (sfp-inner (+ n 1) (+ count 1))
        (sfp-inner (+ n 1) count))))

  (sfp-inner start 0))

; Made these bigger so they'd actually report non-zero runtimes
; on this machine.
(search-for-primes 1000000000000)
(search-for-primes 10000000000000)
(search-for-primes 100000000000000)
(search-for-primes 1000000000000000)