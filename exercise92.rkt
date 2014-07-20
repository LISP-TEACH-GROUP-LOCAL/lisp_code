;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname exercise92) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
(require 2htdp/image)
(define tank-height 16)
(define missile-width 7)
(define missile-height 7)
(define missile-color "red")
(define missile-image (rectangle missile-width missile-height "solid" missile-color))
(define width 200)
(define height 200)
(define background (empty-scene width height))
(define (missile-render.v2 m scene)
  (cond
    [(boolean? m) scene]
    [(posn? m) (place-image missile-image (posn-x m) (posn-y m) scene)]))
(check-expect (missile-render.v2 false background) background)
(check-expect (missile-render.v2 (make-posn 32 (- height tank-height 10))
                                 background)
              (place-image missile-image 32 (- height tank-height 10) background))
(require 2htdp/image)
(require 2htdp/universe)
(define (tank-render t im)
  (place-image tank-image
               (tank-loc t)
               height
               im))
(define tank-width 16)
(define tank-color "blue")
(define ufo-height 20)
(define ufo-width 40)
(define ufo-color "green")
(define ufo-image (rectangle ufo-width ufo-height "solid" ufo-color))
(define tank-image (rectangle tank-width tank-height "solid" tank-color))
(define (ufo-render u im)
  (place-image ufo-image
               (posn-x u)
               (posn-y u)
               im))
(define (si-render.v2 s)
  (tank-render (sigs-tank s)
               (ufo-render (sigs-ufo s)
                           (missile-render.v2 (sigs-missile s)
                                              background))))
(define R 10)
(define (in-reach? x)
  (< (if (posn? x)
         (sqrt(+(sqr(posn-x x))
                (sqr(posn-y x))))
         (abs x))
     R))
(define (si-game-over.v2? si)
  (if (boolean? (sigs-missile si))
      (in-reach? (- (posn-y (sigs-ufo si)) height))
      (or (in-reach? (- (posn-y (sigs-ufo si)) height))
          (in-reach? (make-posn (- (posn-x (sigs-ufo si)) (posn-x (sigs-missile si)))
                                (- (posn-y (sigs-ufo si)) (posn-y (sigs-missile si))))))))
(define (tank-move w)
  (make-tank (+ (tank-loc w) (tank-vel w))
             (tank-vel w)))
(define ufo-move-speed 3)
(define missile-move-speed 5)
(define ufo-random-range 2)
(define (ufo-move w)
  (make-posn (+ (posn-x w) (- (random (+ (* 2 ufo-random-range) 1)) ufo-random-range))
             (+ (posn-y w) ufo-move-speed)))
(define (missile-move w)
  (make-posn (posn-x w) 
             (- (posn-y w) missile-move-speed)))
(define (si-move.v2 w) 
  (if (boolean? (sigs-missile w))
      (make-sigs (ufo-move (sigs-ufo w))
                 (tank-move (sigs-tank w))
                 false)
      (make-sigs (ufo-move (sigs-ufo w))
                 (tank-move (sigs-tank w))
                 (missile-move (sigs-missile w)))))
(define-struct tank (loc vel))
(define-struct sigs (ufo tank missile))
(define (change-vel w vel) 
  (make-sigs (sigs-ufo w) (make-tank (tank-loc(sigs-tank w)) vel) (sigs-missile w)))
(define (si-control.v2 w ke)
  (cond
    [(string=? ke " ") (if (boolean? (sigs-missile w))
                           (make-sigs (sigs-ufo w)
                                      (sigs-tank w)
                                      (make-posn (tank-loc(sigs-tank w))
                                                 height))
                           w)]
    [(string=? ke "left") (change-vel w (- (abs (tank-vel (sigs-tank w)))))]
    [(string=? ke "right") (change-vel w (abs (tank-vel (sigs-tank w))))]))
(define (main) 
  (big-bang (make-sigs (make-posn (/ width 2) 0) (make-tank (/ width 2) 3) false)
            [to-draw si-render.v2]
            [on-tick si-move.v2]
            [stop-when si-game-over.v2?]
            [on-key si-control.v2]))
(check-expect (si-game-over.v2? (make-sigs (make-posn 100 0) (make-tank 100 3) false)) false)
(check-expect (in-reach? (- height)) false)