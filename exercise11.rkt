;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define in "hello")
(cond
  [(string? in)  (string-length in)]
  [(image? in)   (*(image-width in)(image-width in))]
  [(boolean? in) (if in 10 20)]
  [(and(rational? in)(> in 0)) (- in 1)])