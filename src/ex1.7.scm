#lang scheme

;; With the old good-enough? procedure, (sqrt 0.0001)
;; evaluates to 0.03230844833048122 instead of 0.01,
;; and (sqrt 1000000000000000) goes into an infinite loop.

;; The improved version works better because we're using a relative
;; value when comparing with the threshold.

(define (sqrt x)
  (define (sqrt-iter guess)
    (define (improve guess)
      (define (average x y)
        (/ (+ x y) 2))
      (average guess (/ x guess)))

    (define (good-enough? guess)
      (define (square x)
        (* x x))
      (< (/ (abs (- (square guess) x)) x) 0.001))
  
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  
  (sqrt-iter 1.0))
