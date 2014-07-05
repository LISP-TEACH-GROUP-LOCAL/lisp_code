;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise75) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(require 2htdp/universe)
(define-struct editor (pre post))
(define width 200)
(define background (empty-scene width 20))
(define cursor (rectangle 1 20 "solid" "red"))
(define (make-text str) (text str 11 'black))
(define (render x)
  (overlay/align "left"
                 "center"
                 (beside (make-text (editor-pre x))
                         cursor
                         (make-text (editor-post x)))
                 (empty-scene 200 20)))
(define (string-remove-last str) (substring str 0 (- (string-length str) 1)))
(define (string-last str) (string-ith str (- (string-length str) 1)))
(define (string-first str) (substring str 0 1))
(define (string-rest str) (substring str 1))
(define (ignore? ke)
  (or (and (not (= 1 (string-length ke)))
           (not (string=? ke "left"))
           (not (string=? ke "right")))
      (string=? ke "\t")
      (string=? ke "\u007F")))
(define (rub ed)
  (if (= (string-length (editor-pre ed)) 0)
      ed
      (make-editor (string-remove-last (editor-pre ed))
                   (editor-post ed))))
(define (move-left ed)
  (if (= (string-length (editor-pre ed)) 0)
      ed
      (make-editor (string-remove-last (editor-pre ed))
                   (string-append (string-last (editor-pre ed)) (editor-post ed)))))
(define (move-right ed)
  (if (= (string-length (editor-post ed)) 0)
      ed
      (make-editor (string-append (editor-pre ed) (string-first (editor-post ed)))
                   (string-rest (editor-post ed)))))
(define (edit ed ke)
  (cond
    [(ignore? ke) ed]
    [(string=? "\b" ke) (rub ed)]
    [(string=? "left" ke) (move-left ed)]
    [(string=? "right" ke) (move-right ed)]
    [else (let ([new-editor(make-editor (string-append(editor-pre ed) ke)
                                        (editor-post ed))])
            (if (<= (image-width(render new-editor))width) new-editor ed))]))
(define (run string)
  (big-bang (make-editor string "")
            [to-draw render]
            [on-key edit]))