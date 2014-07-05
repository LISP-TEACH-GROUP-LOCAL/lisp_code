;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise72) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define-struct editor (pre post))
(define background (empty-scene 200 20))
(define cursor (rectangle 1 20 "solid" "red"))
(define (make-text str) (text str 11 'black))
(define (render x)
  (overlay/align "left"
                 "center"
                 (beside (make-text (editor-pre x))
                         cursor
                         (make-text (editor-post x)))
                 (empty-scene 200 20)))