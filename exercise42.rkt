;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise42) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define WIDTH 100)
(define HEIGHT 30)
(require 2htdp/image)
(require 2htdp/universe)
(define MT (empty-scene WIDTH HEIGHT))
(define (main s)
  (big-bang s
            [on-key remember]
            [to-draw show]))
(check-expect (remember "hello" " ") "hello")
(check-expect (remember "hello " "w") "hello ")
(define (remember ak ke)
  (if (= (string-length ke) 1) ak (string-append ak ke)))
(check-expect (show "hel") (overlay (frame(text "hel" 11 "red")) MT))
(check-expect (show "mark") (overlay (frame(text "mark" 11 "red")) MT))
(define (show ak)
  (overlay (frame(text ak 11 "red")) MT))