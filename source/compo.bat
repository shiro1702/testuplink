echo off
cls
echo start "create component"
echo "%CD%\components\%1"
mkdir "%CD%\components\%1"
rem copy *.* %1

rem @echo off >"%CD%\components\%1\%1.pug"

@echo div.%1>"%CD%\components\%1\%1.pug"
@echo .%1 { }>"%CD%\components\%1\%1.scss"
@echo import './%1.scss';>"%CD%\components\%1\%1.js"

Echo.>>"существующий_файл.расширение"
Echo import '../components/%1/%1.scss';>>"%CD%\index\compoImp.js"

echo end "create component"