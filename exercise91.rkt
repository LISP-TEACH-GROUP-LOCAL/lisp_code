;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise91) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define tank-height 16)
(define missile-width 7)
(define missile-height 7)
(define missile-color "red")
(define missile-image (rectangle missile-width missile-height "solid" missile-color))
(define width 200)
(define height 200)
(define background (empty-scene width height))
(define (missile-render.v2 m scene)
  (cond
    [(boolean? m) scene]
    [(posn? m) (place-image missile-image (posn-x m) (posn-y m) scene)]))
(check-expect (missile-render.v2 false background) background)
(check-expect (missile-render.v2 (make-posn 32 (- height tank-height 10))
                                 background)
              (place-image missile-image 32 (- height tank-height 10) background))