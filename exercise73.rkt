;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise73) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
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
    [else (make-editor (string-append(editor-pre ed) ke)
                       (editor-post ed))]))
(check-expect (edit (make-editor "hello" "world") "L")
              (make-editor "helloL" "world"))
(check-expect (edit (make-editor "hello" "world") "right")
              (make-editor "hellow" "orld"))
(check-expect (edit (make-editor "hello" "world") "left")
              (make-editor "hell" "oworld"))
(check-expect (edit (make-editor "hello" "world") "up")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "down")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "\b")
              (make-editor "hell" "world"))
(check-expect (edit (make-editor "hello" "world") "\t")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "hello" "world") "\u007F")
              (make-editor "hello" "world"))
(check-expect (edit (make-editor "" "helloworld") "left")
              (make-editor "" "helloworld"))
(check-expect (edit (make-editor "helloworld" "") "right")
              (make-editor "helloworld" ""))