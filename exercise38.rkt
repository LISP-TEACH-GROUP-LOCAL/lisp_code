;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELs (beside WHEEL SPACE WHEEL))
(define WIDTH-OF-WORLD 200)
(define HEIGHT-OF-WORLD 100)
(define BACKGROUND (rectangle WIDTH-OF-WORLD HEIGHT-OF-WORLD "solid" "white"))
(define tree
  (underlay/xy (circle 10 'solid 'green)
               9 15
               (rectangle 2 20 'solid 'brown)))
(define (tock ws)(- ws 3))
(define CAR (above
             (rectangle (* 2 WHEEL-DISTANCE) (* 2 WHEEL-RADIUS) "solid" "red")
             BOTH-WHEELs))
(define Y-CAR (/ HEIGHT-OF-WORLD 2))
(define (render ws)(beside tree(place-image CAR (- WIDTH-OF-WORLD ws) Y-CAR BACKGROUND)))
(define (main x)
  (let([ws (- WIDTH-OF-WORLD x)])
    (big-bang ws
              [on-tick tock]
              [to-draw render]
              [stop-when (lambda(ws)(< ws 0))])))