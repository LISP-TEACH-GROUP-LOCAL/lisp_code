;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise57) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define (tl-next current-state)
  (cond
    [(string=? current-state "red") "green"]
    [(string=? current-state "green") "yellow"]
    [(string=? current-state "yellow") "red"]))
(define width 100)
(define height 30)
(define y (/ height 2))
(define x (/ width 2))
(define SPACE 5)
(define RAD (* SPACE 2))
(define delta (* 2 (+ RAD SPACE)))
(define background (empty-scene width height))
(define (tl-render current-state)
  (place-image (bulb current-state "green")
               (+ x delta)
               y
               (place-image (bulb current-state "yellow")
                            x
                            y
                            (place-image (bulb current-state "red") (- x delta) y background))))
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
            [to-draw tl-render]
            [on-tick tl-next 1]))
(define (bulb on c)
  (if (string=? on c) (circle RAD "solid" c) (circle RAD "outline" c)))