;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise86) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define R 10)
(define (in-reach? x)
  (< (if (posn? x)
         (sqrt(+(sqr(posn-x x))
                (sqr(posn-y x))))
         x)
     R))