;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise76) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define-struct editor (str pos))
(define width 200)
(define background (empty-scene width 20))
(define cursor (rectangle 1 20 "solid" "red"))
(define (make-text str) (text str 11 'black))
(define (render x)
  (overlay/align "left"
                 "center"
                 (beside (make-text (substring (editor-str x) 0 (editor-pos x)))
                         cursor
                         (make-text (substring (editor-str x) (editor-pos x))))
                 (empty-scene 200 20)))
(define (ignore? ke)
  (or (and (not (= 1 (string-length ke)))
           (not (string=? ke "left"))
           (not (string=? ke "right")))
      (string=? ke "\t")
      (string=? ke "\u007F")))
(define (string-delete str i)
  (string-append
   (substring str 0 i)
   (substring str (+ i 1))))
(define (string-insert str i in)
  (string-append
   (substring str 0 i)
   in
   (substring str i)))
(define (rub ed)
  (if (= (editor-pos ed) 0)
      ed
      (make-editor (string-delete (editor-str ed) (- (editor-pos ed) 1))
                   (- (editor-pos ed) 1))))
(define (move-left ed)
  (if (= (editor-pos ed) 0)
      ed
      (make-editor (editor-str ed)
                   (- (editor-pos ed) 1))))
(define (move-right ed)
  (if (= (string-length (editor-str ed)) (editor-pos ed))
      ed
      (make-editor (editor-str ed)
                   (+ (editor-pos ed) 1))))
(define (edit ed ke)
  (cond
    [(ignore? ke) ed]
    [(string=? "\b" ke) (rub ed)]
    [(string=? "left" ke) (move-left ed)]
    [(string=? "right" ke) (move-right ed)]
    [else (let ([new-editor(make-editor (string-insert (editor-str ed) (editor-pos ed) ke)
                                        (+ (editor-pos ed) 1))])
            (if (<= (image-width(render new-editor))width) new-editor ed))]))
(define (run string)
  (big-bang (make-editor string (string-length string))
            [to-draw render]
            [on-key edit]))