#lang scheme

(define (ex1.3 a b c) 
  (define (square n)
    (* n n))
  
  (define (sum-of-squares l m) 
    (+ (square l)
       (square m)))

 (cond ((> a b) (if (> b c) 
                    (sum-of-squares a b) 
                    (sum-of-squares a c)))
       (else (if (> a c) 
                  (sum-of-squares b a) 
                  (sum-of-squares b c)))))
