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
        (define ancho-canvas (send canvas get-width))
          (send dc set-brush "yellow" 'solid)
          (send dc draw-rectangle 0 0 (send canvas get-width) 100)
          (send dc set-font (make-object font% 36 'swiss 'normal 'bold))
            (define-values (ancho-texto alto-texto d a)
              (send dc get-text-extent "Bienvenido al gimnasio!"))
          (send dc draw-text "Bienvenido al gimnasio!" (/ (- ancho-canvas ancho-texto)2) 25
        ))]))

(define fuente-subtitulo (make-object font% 24 'swiss 'italic 'normal))

(define img-inscripcion-nopremium 
  (make-object bitmap% "imagen-inscripcion-nopremium.jpg"))
  (define img-inscripcion-premium 
  (make-object bitmap% "imagen-inscripcion-premium.jpg"))

(define panel-imagenes-inscripcion
  (new horizontal-panel%
      [parent ventana-inscripcion]
      [alignment '(center top)]))

(define inscripcion-nopremium
  (new vertical-panel%
    [parent panel-imagenes-inscripcion]
      [alignment '(center top)]
      [stretchable-width #f] [stretchable-height #f]
      [horiz-margin 100] [vert-margin 30]))  

  (new message%
    [parent inscripcion-nopremium] 
    [label "Matricula no premium"]
    [font fuente-subtitulo])

(define canvas-imagen-nopremium
  (new canvas%
    [parent inscripcion-nopremium]
      [min-width 275] [min-height 275]
        [stretchable-width #f] [stretchable-height #f]
        [horiz-margin 100] [vert-margin 30]
    [paint-callback
      (lambda (canvas dc)
        (send dc set-scale
              (/ 275 (send img-inscripcion-nopremium get-width))
              (/ 275 (send img-inscripcion-nopremium get-height)))
        (send dc draw-bitmap img-inscripcion-nopremium 0 0))]))

(define inscripcion-premium
  (new vertical-panel%
    [parent panel-imagenes-inscripcion]
      [alignment '(center top)]
      [stretchable-width #f]
      [stretchable-height #f]
      [horiz-margin 100]
      [vert-margin 30]))  

  (new message%
    [parent inscripcion-premium] 
    [label "Matricula premium"]
    [font fuente-subtitulo])

(define canvas-imagen-premium
  (new canvas%
    [parent inscripcion-premium]
      [min-width 275]
      [min-height 275]
        [stretchable-width #f]
        [stretchable-height #f]
        [horiz-margin 100]
        [vert-margin 30]
    [paint-callback
      (lambda (canvas dc)
        (send dc set-scale
              (/ 275 (send img-inscripcion-premium get-width))
              (/ 275 (send img-inscripcion-premium get-height)))
        (send dc draw-bitmap img-inscripcion-premium 0 0))]))
      
(define ventana-inscripcion-nopremium
  (new frame%
    [label "Inscripcion no premium"]
    [width 700][height 1000]))

(define ventana-inscripcion-premium
  (new frame%
    [label "Inscripcion no premium"]
    [width 700][height 1000]))
        
(new button%
  [parent inscripcion-nopremium]
    [label "Suscribete!"]
    [font (make-object font% 18 'swiss 'normal 'bold)]   
    [min-width 165][min-height 60]                                      
    [stretchable-width #f] 
      [callback (lambda (button popup)
        (send ventana-inscripcion show #f)(send ventana-inscripcion-nopremium show #t))])

(new button%
  [parent inscripcion-premium]
    [label "Suscribete!"]
    [font (make-object font% 18 'swiss 'normal 'bold)]   
    [min-width 165][min-height 60]                                     
    [stretchable-width #f] 
      [callback (lambda (button popup)
        (send ventana-inscripcion show #f)(send ventana-inscripcion-nopremium show #t))])

(send ventana-inscripcion show #t)

; VENTANA INSCRIPCION NO PREMIUM

(define panel-ventana-inscripcion-nopremium
  (new vertical-panel%
    [parent ventana-inscripcion-nopremium]
    [alignment '(left top)]
    [horiz-margin 20][vert-margin 20]
    [spacing 10]
))

(define fuente-titulo-inscripcion-nopremium (make-object font% 24 'swiss 'italic 'normal))

(new message%
  [parent panel-ventana-inscripcion-nopremium] 
    [label "Datos del inscrito"]
    [font fuente-titulo-inscripcion-nopremium])

(define campo-nombre
(new text-field%
    [parent panel-ventana-inscripcion-nopremium]
  [label "Nombre:   "]))

(define campo-apellido
(new text-field%
    [parent panel-ventana-inscripcion-nopremium]
  [label "Apellido:   "]))

(define campo-edad
(new text-field%
    [parent panel-ventana-inscripcion-nopremium]
  [label "Edad:   "]))

(define campo-cedula
  (new text-field%
    [parent panel-ventana-inscripcion-nopremium]
    [label "Cedula:   "]))

(define seleccion-sexo
  (new radio-box%
    [parent panel-ventana-inscripcion-nopremium]
    [label "Sexo:   "]
    [choices '("Hombre" "Mujer" "No binario" "Genero fluido" "Prefiero no decirlo")]))

(define check-terminos
  (new check-box% 
    [parent panel-ventana-inscripcion-nopremium] 
    [label "Acepto los términos \n y condiciones"]))
