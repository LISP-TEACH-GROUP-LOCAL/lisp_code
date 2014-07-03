;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise63) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct ballf (x y deltax deltay))
(define-struct ball (location velocity))
(define-struct vel (deltax deltay))
(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))
(make-ballf 30 40 -10 5)
