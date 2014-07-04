;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise70) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define-struct time-scince-midnight (hours minutes seconds))
(define (time->seconds t)
  (+ (time-scince-midnight-seconds t)
     (* 60(time-scince-midnight-minutes t))
     (* 3600(time-scince-midnight-hours t))))