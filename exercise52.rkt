;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise52) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (resting? x) (and (string? x) (string=? "resting" x)))
(check-expect (resting? -1) false)
(check-expect (resting? 77) false)
(check-expect (resting? "resting") true)