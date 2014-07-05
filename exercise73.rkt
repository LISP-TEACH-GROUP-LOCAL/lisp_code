;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise73) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(define (string-remove-last str) (substring str 0 (- (string-length str) 1)))
(define (string-last str) (string-ref str (- (string-length str) 1)))
(define (string-first str) (substring str 0 0))
(define (string-rest str) (substring str 1))
(define-struct editor (pre post))
(define (ignore? ke)
  (and (= 1 (string-length ke))
       (not(= ke "\t"))
       (not (= ke "\u007F"))))
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
    [else ed]))