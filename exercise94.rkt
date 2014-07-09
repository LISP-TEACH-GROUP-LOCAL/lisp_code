;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise94) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct spider (volume legs-count))
(define-struct elephant (volume))
(define boa-width 0.5)
(define boa-height 0.4)
(define-struct boa-constrictor (length girth))
(define-struct armadillo (volume age))
(define (get-volume animal)
  (cond
    [spider? (spider-volume animal)]
    [elephant? (elephant-volume animal)]
    [boa-constrictor? (* boa-width boa-height (boa-length animal))]
    [armadillo? (armadillo-volume animal)]))