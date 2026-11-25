#lang racket/gui

(define ventana-inscripcion
  (new frame%
    [label "Gimnasio Charlie Kirk"]
      [width 1000][height 700]))

(define canvas-titulo
  (new canvas%
  [parent ventana-inscripcion]
  [min-width 1000][min-height 100]
  [stretchable-height #f]
  [paint-callback
        (lambda (canvas dc)
          (send dc set-brush "yellow" 'solid)
          (send dc draw-rectangle 0 0 (send canvas get-width) 100)
          (send dc set-font (make-object font% 36 'swiss 'normal 'bold))
          (send dc draw-text "Bienvenido al gimnasio!" 235 25
        ))]))

(define panel-imagenes-inscripcion
  (new horizontal-panel%
      [parent ventana-inscripcion]
      [alignment '(center top)]))

(define img-inscripcion-nopremium 
  (make-object bitmap% "imagen-inscripcion-nopremium.jpg"))
  (define img-inscripcion-premium 
  (make-object bitmap% "imagen-inscripcion-premium.jpg"))

(define canvas-imagen-nopremium
  (new canvas%
    [parent panel-imagenes-inscripcion]
      [min-width 275]
      [min-height 275]
        [stretchable-width #f]
        [stretchable-height #f]
        [horiz-margin 145]
        [vert-margin 80]
    [paint-callback
      (lambda (canvas dc)
        (send dc set-scale
              (/ 275 (send img-inscripcion-nopremium get-width))
              (/ 275 (send img-inscripcion-nopremium get-height)))
        (send dc draw-bitmap img-inscripcion-nopremium 0 0))]))

(define canvas-imagen-premium
  (new canvas%
    [parent panel-imagenes-inscripcion]
      [min-width 275]
      [min-height 275]
        [stretchable-width #f]
        [stretchable-height #f]
        [horiz-margin 145]
        [vert-margin 80]
    [paint-callback
      (lambda (canvas dc)
        (send dc set-scale
              (/ 275 (send img-inscripcion-premium get-width))
              (/ 275 (send img-inscripcion-premium get-height)))
        (send dc draw-bitmap img-inscripcion-premium 0 0))]))

(send ventana-inscripcion show #t)