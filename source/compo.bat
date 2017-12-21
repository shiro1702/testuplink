echo off
cls
echo start "create component"
echo "%CD%\components\%1"
mkdir "%CD%\components\%1"
rem copy *.* %1

rem @echo off >"%CD%\components\%1\%1.pug"

@echo 1
@echo mixin %1>"%CD%\components\%1\%1.pug"
@echo 	div.%1&attributes(attributes)>>"%CD%\components\%1\%1.pug"
@echo 		block>>"%CD%\components\%1\%1.pug"

@echo .%1 { }>"%CD%\components\%1\%1.scss"

@echo import './%1.scss';>"%CD%\components\%1\%1.js"

rem Echo.>>"%CD%\index\compoIn.js"
Echo import '../components/%1/%1.scss';>>"%CD%\index\compoIn.js"
rem Echo.>>"%CD%\index\compoIn.pug"
Echo include ../components/%1/%1.pug>>"%CD%\index\compoIn.pug"

echo end "create component"