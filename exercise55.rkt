;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise55) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
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
(define INITAL-Y ROCKET-CENTER)
(define (place-rocket y) (place-image ROCKET ROCKET-X (- HEIGHT y) BACKG))
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
     (place-rocket x)]))
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
 (place-rocket 53))
(define (launch x ke)
  (cond
    [(and(string? x) (string=? " " ke)) -3]
    [else x]))
(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)
(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) INITAL-Y)
(check-expect (fly 10) (+ 10 YDELTA))
(check-expect (fly 22) (+ 22 YDELTA))
(define (fly x)
  (cond
    [(string? x) x]
    [(<= -3 x -1) (if (= x -1) INITAL-Y (+ x 1))]
    [else (+ x YDELTA)]))
(define (main s)
  (big-bang s
            [to-draw show]
            [on-key launch]
            [on-tick fly 1]
            [stop-when (lambda(x)(and(real? x)(> x (+ HEIGHT ROCKET-CENTER))))]))