;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise45) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define max-happiness 100)
(define height 200)
(define width 100)
(define ratio (/ height max-happiness))
(define (bound w)
  (cond
    [(> w max-happiness) max-happiness]
    [(< w 0) 0]
    [else w]))
(define background (empty-scene width height))
(define (show s) 
  (let ([w (bound s)])
    (place-image
     (frame 
      (rectangle width (* w ratio) "solid" "red"))
     (/ width 2)
     (- height(/ (* w ratio) 2))
     background)))
(define (dec w)(bound (- w 0.1)))
(define (feed w ke)
  (cond
    [(string=? "down" ke) (+ w 1/5)]
    [(string=? "up" ke) (+ w 1/3)]
    [else w]))
(define (main w)
  (big-bang w
            [on-tick dec]
            [to-draw show]
            [on-key feed]))