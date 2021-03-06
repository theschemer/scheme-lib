;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Copyright 2016-2080 evilbinary.
;作者:evilbinary on 12/24/16.
;邮箱:rootdebug@163.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(library (scheme-lib gui imgui)
         (export
            imgui-init
            imgui-exit
            imgui-test

            imgui-touch-event
            imgui-key-event
            imgui-motion-event
            imgui-mouse-event
            imgui-resize
            
            imgui-scale
            imgui-render-start
            imgui-render-end
            imgui-disable-default-color
            imgui-get-default-color
            imgui-make-vec2
            imgui-make-text-edit-callback
            imgui-load-texture
            imgui-pvec2
            imgui-uvec2

            imgui-load-style 
            imgui-save-style 
            imgui-reset-style

            imgui-get-io
            imgui-text
            imgui-new-frame
            imgui-render
            imgui-color-edit3
            imgui-set-next-window-size
            imgui-set-next-window-pos
            imgui-begin
            imgui-end
            imgui-button
            imgui-small-button
            imgui-input-text
            imgui-input-text-multiline
            imgui-checkbox
            imgui-get-text-line-height
            imgui-get-mouse-cursor
            imgui-is-mouse-clicked
            imgui-is-mouse-down
            imgui-image
            imgui-tree-node
            imgui-tree-pop

            ;consts
            imgui-set-cond-always
            imgui-set-cond-once
            imgui-set-cond-first-use-ever
            imgui-set-cond-appearing

            <<
            >>
            imgui-begin-group
            imgui-end-group
            imgui-same-line
            imgui-separator

          )

        (import  (scheme) (scheme-lib utils libutil) )

        (define lib-name
           (case (machine-type)
             ((arm32le) "libimgui.so")
             ((a6nt i3nt ta6nt ti3nt)  "libimgui.dll")
             ((a6osx i3osx ta6osx ti3osx)  "libimgui.so")
             ((a6le i3le ta6le ti3le) "libimgui.so")))
         (define lib (load-lib lib-name))
         ;(define lib (load-shared-object lib-name))

         (define-syntax define-imgui
                    (syntax-rules ()
                      ((_ ret name args)
                       (define name
                         (foreign-procedure (lower-camel-case (string-split (symbol->string 'name) #\- )) args ret)))))

        

         (define-imgui void* imgui-get-io () )
         (define-imgui void imgui-render () )
         (define-imgui void imgui-text (string) )
         (define-imgui void imgui-new-frame () )
         (define-imgui void imgui-color-edit3 (string void*) )
         (define-imgui void imgui-set-next-window-size (void* int) )
         (define-imgui void imgui-set-next-window-pos (void* int) )

         (define-imgui void imgui-begin (string int) )
         (define-imgui void imgui-end () )
         (define-imgui boolean imgui-button (string void*) )
         (define-imgui boolean imgui-small-button (string void*) )
         (define-imgui boolean imgui-checkbox (string u8*) )
         (define-imgui boolean imgui-tree-node (string) )
         (define-imgui void imgui-tree-pop () )


         (define-imgui boolean imgui-input-text (string string int int void* void*))
         (define-imgui boolean imgui-input-text-multiline (string string int int void* void* void* ) )
         (define-imgui float imgui-get-text-line-height () )
         (define-imgui int imgui-get-mouse-cursor () )
         (define-imgui boolean imgui-is-mouse-clicked (int boolean) )
         (define-imgui boolean imgui-is-mouse-down (int) )
         (define-imgui void imgui-image (void* void* void* void*) )



        (define imgui-set-cond-always 0)
        (define imgui-set-cond-once 2)
        (define imgui-set-cond-first-use-ever 4)
        (define imgui-set-cond-appearing 8)

        (define << fxarithmetic-shift-left)
        (define >> fxarithmetic-shift-right)
        (define-imgui void imgui-begin-group () )
        (define-imgui void imgui-end-group () )
        (define-imgui void imgui-same-line () )
        (define-imgui void imgui-separator () )

        (define imgui-resize (foreign-procedure "imgui_resize" (int int) void ))
        (define imgui-render-start (foreign-procedure "imgui_render_start" () void ))
        (define imgui-make-vec2 (foreign-procedure "imgui_make_vec2"  (float float) void* ))
        (define imgui-render-end (foreign-procedure "imgui_render_end" () void ))
        (define imgui-motion-event (foreign-procedure "imgui_motion_event" (int int) void ))
        (define imgui-mouse-event (foreign-procedure "imgui_mouse_event" (int int) void  ))
        (define imgui-key-event (foreign-procedure "imgui_key_event"  (int int int string) void))
        (define imgui-touch-event (foreign-procedure "imgui_touch_event" (int int int) void ))

        (define imgui-init (foreign-procedure "imgui_init" () void ))
        (define imgui-exit (foreign-procedure "imgui_exit" () void ))
        (define imgui-test (foreign-procedure "imgui_test" () void ))


         ;(define-c-function void imgui-init () )
         ;(define-c-function void imgui-exit () )
         ;(define-c-function void imgui-test () )
         ;(define-c-function void imgui-motion-event (int int) )
         ;(define-c-function void imgui-mouse-event (int int) )
         ;(define-c-function void imgui-touch-event (int int int) )
         ;(define-c-function void imgui-key-event (int int int string) )
         (define-c-function void imgui-scale (float float) )
         ; (define-c-function void imgui-render-start () )
         ;(define-c-function void imgui-render-end () )
         (define-c-function void imgui-disable-default-color () )
         (define-c-function void* imgui-get-default-color () )
         ;(define-c-function void* imgui-make-vec2 (float float))
         (define-c-function void* imgui-make-vec4 (float float float float))
         (define-c-function void* imgui-make-text-edit-callback (scheme-object))
         (define-c-function void* imgui-load-texture (string))

         (define imgui-pvec2 (foreign-procedure "imgui_pvec2" (float float) void* ))
         (define imgui-uvec2 (foreign-procedure "imgui_uvec2" (void*) void ))
         ;(define-c-function void* imgui-pvec2 (float float) )
         ;(define-c-function void imgui-uvec2 (void*) )
         


         ;;样式加载和修改
        ;(define-c-function boolean imgui-load-style (string) )
        ;(define-c-function boolean imgui-save-style (string) )
        ;(define-c-function boolean imgui-reset-style (int) )
        (define imgui-load-style (foreign-procedure "imgui_load_style" (string) void ))
        (define imgui-save-style (foreign-procedure "imgui_save_style" (string) void ))
        (define imgui-reset-style (foreign-procedure "imgui_reset_style" (int) void ))


          )