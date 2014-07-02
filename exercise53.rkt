;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise53) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define (resting? x) (and (string? x) (string=? "resting" x)))
(check-expect (resting? -1) false)
(check-expect (resting? 77) false)
(check-expect (resting? "resting") true)
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)
(define BACKG  (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))
(define ROCKET-X 10)
(define INITAL-Y (- HEIGHT ROCKET-CENTER))
(define (place-rocket y) (place-image ROCKET ROCKET-X y BACKG))
(define (show x)
  (cond
    [(string? x)
     (place-rocket INITAL-Y)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  ROCKET-X
                  (* 3/4 WIDTH)
                  (place-rocket INITAL-Y))]
    [(>= x 0)
     (place-rocket(- x ROCKET-CENTER))]))
(define (launch x ke)
  x)
(define (fly x)
  x)
(check-expect
 (show "resting")
 (place-rocket INITAL-Y))
(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              ROCKET-X
              (* 3/4 WIDTH)
              (place-rocket INITAL-Y)))
(check-expect
 (show 53)
 (place-rocket (- 53 ROCKET-CENTER)))