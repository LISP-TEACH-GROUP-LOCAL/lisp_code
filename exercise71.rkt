;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise71) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct three-letter (first second third))
(define (different-letter lhs rhs) 
  (if (string=? lhs rhs) lhs "*"))
(define (different-three-letter lhs rhs)
  (make-three-letter (different-letter(three-letter-first lhs)(three-letter-first rhs))
                     (different-letter(three-letter-second lhs)(three-letter-second rhs))
                     (different-letter(three-letter-third lhs)(three-letter-third rhs))))
(define different different-three-letter)