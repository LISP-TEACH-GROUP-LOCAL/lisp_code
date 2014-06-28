;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define (image-classify image)
  (let(
       [w (image-width image)]
       [h (image-height image)])
    (cond
      [(< w h) "tall"]
      [(< h w) "wide"]
      [else "square"])))