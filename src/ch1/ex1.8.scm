#lang scheme

(define (cube-root x)
  (define (cr-iter guess x)
    (define (improve guess)
      (/ (+ (/ x (* guess guess))
            (* 2 guess))
         3))

    (define (good-enough? guess)
      (define (cube x)
        (* x x x))
      (< (/ (abs (- (abs (cube guess)) x)) x) 0.001))
  
    (if (good-enough? guess)
        guess
        (cr-iter (improve guess) x)))
  
  (if (< x 0) (- (cr-iter 1.0 (- x))) (cr-iter 1.0 x)))
