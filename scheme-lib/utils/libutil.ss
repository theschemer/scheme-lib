;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Copyright 2016-2080 evilbinary.
;作者:evilbinary on 12/24/16.
;邮箱:rootdebug@163.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(library (scheme-lib utils libutil)
  (export
    load-lib
    define-c-function
    lower-camel-case
    string-split
    string-replace!
    load-directories
  )
  (import (scheme) (scheme-lib utils strings))
  
  (define loaded-libs (make-hashtable equal-hash equal?))

  (define (load-directories)
    (append '("." "/usr/local/lib")
      (if (file-directory? "./lib/scheme-lib")
        (map (lambda (x) (format "./lib/scheme-lib/~a" x)) (directory-list "./lib/scheme-lib"))
        '())
      (if (file-directory? "./scheme-lib")
        (map (lambda (x) (format "./scheme-lib/~a" x)) (directory-list "./scheme-lib"))
        '())))

  (define (load-lib name)
    (let loop ([libs (load-directories)])
      (if (pair? libs)
          (begin
            (if (and (file-exists? (string-append (car libs) "/" name)) 
                      (eq? "" (hashtable-ref loaded-libs (string-append (car libs) "/" name) "") ) )
              (begin 
                ;;(display (format "load-lib ~a\n" (string-append (car libs) "/" name)) ) 
                (load-shared-object (string-append (car libs) "/" name)) 
                (hashtable-set! loaded-libs (string-append (car libs) "/" name) name )))
          (loop (cdr libs))))))
  
  (define-syntax define-c-function
            (syntax-rules ()
              ((_ ret name args)
                (define name
                  (foreign-procedure (string-replace! #\- #\_ (symbol->string 'name) ) args ret)))))
)
    
