;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise68) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
"black"
42
(define-struct person (fstname lstname male?))
(define remilia (make-person "remilia" "scarlet" false))
remilia
(define-struct dog (owner name age happiness))
(make-dog remilia "PADIO" 16 100)
(make-posn 7 7)