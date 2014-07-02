;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(check-expect (door-closer "locked") "locked")
(check-expect (door-closer "closed") "closed")
(check-expect (door-closer "open") "closed")
(define (door-closer state-of-door)
  (cond
    [(string=? "locked" state-of-door) "locked"]
    [else "closed"]))
(check-expect (door-actions "locked" "u") "closed")
(check-expect (door-actions "closed" "l") "locked")
(check-expect (door-actions "closed" " ") "open")
(check-expect (door-actions "open" "a") "open")
(check-expect (door-actions "closed" "a") "closed")
(define (door-actions s k)
  (cond
    [(and (string=? "locked" s) (string=? "u" k)) "closed"]
    [(and (string=? "closed" s) (string=? "l" k)) "locked"]
    [(and (string=? "closed" s) (string=? " " k)) "open"]
    [else s]))
(check-expect (door-render "closed") (text "closed" 40 "red"))
(define (door-render s)
  (text s 40 "red"))
(define (door-simulation initial-state)
  (big-bang initial-state
            (on-tick door-closer 3)
            (on-key door-actions)
            (to-draw door-render)))