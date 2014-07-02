;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise56) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define first-interval 1000)
(define first-tax 0.05)
(define second-tax 0.08)
(define second-interval 10000)
(define (sales-tax p)
  (cond
    [(< p first-interval) 0]
    [(< p second-interval) (* first-tax p)]
    [else (* second-tax p)]))
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) 50)
(check-expect (sales-tax 1282) 64.10)
(check-expect (sales-tax 10000) 800)
(check-expect (sales-tax 12017) 961.36)