;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise51) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))
(define ROCKET-X 10)
(define INITAL-Y (- HEIGHT ROCKET-CENTER))
(define (show x)
  (cond
    [(string? x)
     (place-image ROCKET ROCKET-X INITAL-Y BACKG)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  ROCKET-X
                  (* 3/4 WIDTH)
                  (place-image ROCKET ROCKET-X INITAL-Y BACKG))]
    [(>= x 0)
     (place-image ROCKET ROCKET-X (- x ROCKET-CENTER) BACKG)]))
(define (launch x ke)
  x)
(define (fly x)
  x)
(check-expect
 (show "resting")
 (place-image ROCKET ROCKET-X INITAL-Y BACKG))
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              ROCKET-X
              (* 3/4 WIDTH)
              (place-image ROCKET
                           ROCKET-X
                           INITAL-Y
                           BACKG)))
(check-expect
 (show 53)
 (place-image ROCKET ROCKET-X (- 53 ROCKET-CENTER) BACKG))