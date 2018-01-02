;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;作者:evilbinary on 2017-08-31 23:54:31.
;邮箱:rootdebug@163.com
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;http例子

(import (scheme-lib net curl))

(display (url->html "http://evilbinary.org/"))
(display (url->file "https://raw.githubusercontent.com/evilbinary/scheme-lib/master/data/screenshot/game-demo.png" "game.png"))



