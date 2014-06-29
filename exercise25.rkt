;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise25) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define original-ticket-price 5.0)
(define ticket-price-rate-of-change (/ 15 0.1))
(define original-attendance 120)
(define original-cost 0)
(define cost-rate-of-change 1.5)
(define (attendees ticket-price)
  (- original-attendance
     (* (- ticket-price original-ticket-price)
        ticket-price-rate-of-change)))
(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))
(define (cost ticket-price)
  (+ original-cost
     (* cost-rate-of-change (attendees ticket-price))))
(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
(define (new-profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 0
        (* 1.5
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))
(= (new-profit 3)(profit 3))
(= (new-profit 4)(profit 4))
(= (new-profit 5)(profit 5))