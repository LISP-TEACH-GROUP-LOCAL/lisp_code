;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise62) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define SPEED 3)
(define-struct balld (location direction))
(define radius 10)
(define ball (circle radius "solid" "red"))
(define width 500)
(define height 200)
(define scene (empty-scene width height))
(define ball-x 100)
(define (place-ball balld)
  (place-image ball
               ball-x
               (- height
                  (balld-location balld)
                  radius)
               scene))
(define (move-ball balld)
  (make-balld (+ (balld-location balld)
                 (if (eq? (balld-direction balld) 'up) SPEED (- SPEED)))
              (balld-direction balld)))
(define (main balld)
  (big-bang balld
            [to-draw place-ball]
            [on-tick move-ball]
            [stop-when (lambda(x)(or (> (balld-location x) height)(< (balld-location x) 0)))]))