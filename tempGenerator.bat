@echo off

:Root
REM set name=test
set /p name=What is the folder name:
if [%name%] == [] goto Root
if %name% == "stop" exit
mkdir %name%

REM -----------------------------------------------------------------
REM goto folder root
cd %name%
md src views

REM Create readme file
set /p description=description:
@echo # __%name%__ >> ./readme.md
REM if %description% == "stop" cd .. rmdir %name%
if NOT [%description%] == [] @echo "%description%"" >> ./readme.md
@echo. >> ./readme.md
set /p author=Author:
if [%author%] == [] set /p author=none
@echo ## __Getting started ^!__ >> ./readme.md
@echo. >> ./readme.md
@echo ### Prerequisites : >> ./readme.md
@echo. >> ./readme.md
@echo To properly run the project you will need: >> ./readme.md
@echo ^* ^[Node.js^]^(https:^/^/nodejs.org^/en^/download^/^) v6+ >> ./readme.md
@echo. >> ./readme.md
@echo ### Installing : >> ./readme.md
@echo. >> ./readme.md
@echo ```sh >> ./readme.md
@echo # Clone the repo >> ./readme.md
@echo git clone ^<git url^> >> ./readme.md
@echo. >> ./readme.md
@echo # Go to the repo folder >> ./readme.md
@echo cd %name% >> ./readme.md
@echo. >> ./readme.md
@echo # Install dependencies >> ./readme.md
@echo npm install >> ./readme.md
@echo ``` >> ./readme.md
@echo. >> ./readme.md
@echo ### Update npm library : >> ./readme.md
@echo ^*If you update, check gulpfile.js* >> ./readme.md
@echo ```sh >> ./readme.md
@echo # Update dependencies >> ./readme.md
@echo npm update >> ./readme.md
@echo. >> ./readme.md
@echo npm audit fix --force >> ./readme.md
@echo ``` >> ./readme.md
@echo. >> ./readme.md
@echo ### Building : >> ./readme.md
@echo. >> ./readme.md
@echo ```sh >> ./readme.md
@echo gulp build >> ./readme.md
@echo ``` >> ./readme.md
@echo. >> ./readme.md
@echo ## Tech stack : >> ./readme.md
@echo. >> ./readme.md
@echo ^* SCSS with BEM naming convention >> ./readme.md
@echo ^* ES6 >> ./readme.md
@echo. >> ./readme.md
@echo ## Authors : >> ./readme.md
@echo. >> ./readme.md
@echo ^* %author% >> ./readme.md

REM -----------------------------------------------------------------
REM Create .gitignore
@echo Help https:^/^/www.atlassian.com^/git^/tutorials^/saving-changes^/gitignore >> .gitignore
@echo. >> .gitignore
@echo # Dependency directories >> .gitignore
@echo node_modules^/ >> .gitignore
REM -----------------------------------------------------------------

REM Create index.html
@echo ^<!DOCTYPE html^> >> ./index.html
@echo ^<html lang="en"^> >> ./index.html
@echo ^<head^> >> ./index.html
@echo     ^<meta charset="UTF-8"^> >> ./index.html
@echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> ./index.html
@echo     ^<meta http-equiv="X-UA-Compatible" content="ie=edge"^> >> ./index.html
@echo     ^<link rel="stylesheet" href="src/styles/style.css"^> >> ./index.html
@echo     ^<title^>%name%^<^/title^> >> ./index.html
@echo ^<^/head^> >> ./index.html
@echo ^<body^> >> ./index.html
@echo     ^<h1^>%name%^<^/h1^> >> ./index.html
@echo. >> ./index.html
@echo     ^<script src="src/scripts/main.js"^>^<^/script^> >> ./index.html
@echo ^<^/body^> >> ./index.html
@echo ^<^/html^> >> ./index.html

REM -----------------------------------------------------------------
set /p license=license[ISC]:
if NOT DEFINED license set license=ISC
REM -----------------------------------------------------------------
REM Create package.json
@echo { >> ./package.json
@echo   "name": "%name%", >> ./package.json
@echo   "version": "1.0.0", >> ./package.json
@echo   "description": "%description%", >> ./package.json
@echo   "main": "index.js", >> ./package.json
@echo   "scripts": { >> ./package.json
@echo     "test": "echo \"Error: no test specified\" && exit 1" >> ./package.json
@echo   }, >> ./package.json
@echo   "author": "%author%", >> ./package.json
@echo   "license": "%license%", >> ./package.json
@echo   "dependencies": { >> ./package.json
@echo   } >> ./package.json
@echo } >> ./package.json


REM -----------------------------------------------------------------

REM Create src folder content
cd src
md styles scripts images

REM Create script.js
@echo console.log("Hello world"); >> ./scripts/main.js

REM Create style.css
@echo ^@import "parts/reset.css"; >> ./styles/style.css
@echo ^@import "parts/main.css"; >> ./styles/style.css

cd styles
mkdir parts

REM -----------------------------------------------------------------
REM main.css
@echo body { >> ./parts/main.css
@echo     background: #efefef; >> ./parts/main.css
@echo     color: red; >> ./parts/main.css
@echo } >> ./parts/main.css

REM -----------------------------------------------------------------
REM reset.css
@echo /* http://meyerweb.com/eric/tools/css/reset/ >> ./parts/reset.css
@echo    v2.0 ^| 20110126 >> ./parts/reset.css
@echo    License^: none (public domain) >> ./parts/reset.css
@echo */ >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo html, body, div, span, applet, object, iframe, >> ./parts/reset.css
@echo h1, h2, h3, h4, h5, h6, p, blockquote, pre, >> ./parts/reset.css
@echo a, abbr, acronym, address, big, cite, code, >> ./parts/reset.css
@echo del, dfn, em, img, ins, kbd, q, s, samp, >> ./parts/reset.css
@echo small, strike, strong, sub, sup, tt, var, >> ./parts/reset.css
@echo b, u, i, center, >> ./parts/reset.css
@echo dl, dt, dd, ol, ul, li, >> ./parts/reset.css
@echo fieldset, form, label, legend, >> ./parts/reset.css
@echo table, caption, tbody, tfoot, thead, tr, th, td, >> ./parts/reset.css
@echo article, aside, canvas, details, embed, >> ./parts/reset.css
@echo figure, figcaption, footer, header, hgroup, >> ./parts/reset.css
@echo menu, nav, output, ruby, section, summary, >> ./parts/reset.css
@echo time, mark, audio, video { >> ./parts/reset.css
@echo     margin:0; >> ./parts/reset.css
@echo     padding:0; >> ./parts/reset.css
@echo     border:0; >> ./parts/reset.css
@echo     font-size:100%; >> ./parts/reset.css
@echo     font:inherit; >> ./parts/reset.css
@echo     vertical-align:baseline; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* box-sizing */ >> ./parts/reset.css
@echo *{ >> ./parts/reset.css
@echo 	box-sizing: border-box; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* HTML5 display-role reset for older browsers */ >> ./parts/reset.css
@echo article, aside, details, figcaption, figure, >> ./parts/reset.css
@echo footer, header, hgroup, menu, nav, section { >> ./parts/reset.css
@echo     display:block; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo body { >> ./parts/reset.css
@echo     line-height:1; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo ol, ul { >> ./parts/reset.css
@echo     list-style:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo blockquote, q { >> ./parts/reset.css
@echo     quotes:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo blockquote:before, blockquote:after, >> ./parts/reset.css
@echo q:before, q:after { >> ./parts/reset.css
@echo     content:''; >> ./parts/reset.css
@echo     content:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo table { >> ./parts/reset.css
@echo     border-collapse:collapse; >> ./parts/reset.css
@echo     border-spacing:0; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* apply a natural box layout model to all elements */ >> ./parts/reset.css
@echo *,*^:^:before,*^:^:after,*^:before,*^:after { >> ./parts/reset.css
@echo     -moz-box-sizing:border-box;-webkit-box-sizing:border-box;box-sizing:border-box; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo  >> ./parts/reset.css
@echo /* inputs */ >> ./parts/reset.css
@echo input,button,textarea,select { >> ./parts/reset.css
@echo     color^:inherit; >> ./parts/reset.css
@echo     font-size^:inherit; >> ./parts/reset.css
@echo     font-style^:inherit; >> ./parts/reset.css
@echo     font-family^:inherit; >> ./parts/reset.css
@echo     -webkit-border-radius:0; >> ./parts/reset.css
@echo     border-radius^:0; >> ./parts/reset.css
@echo     -webkit-padding-start:0; >> ./parts/reset.css
@echo     align-items^:flex-start; >> ./parts/reset.css
@echo     text-index^:0; >> ./parts/reset.css
@echo     border^:none; >> ./parts/reset.css
@echo     outline^:none; >> ./parts/reset.css
@echo     background^:none; >> ./parts/reset.css
@echo     padding^:0; >> ./parts/reset.css
@echo     margin^:0; >> ./parts/reset.css
@echo     width^:auto; >> ./parts/reset.css
@echo     height^:auto; >> ./parts/reset.css
@echo     line-height^:1em; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* inputs appearance (not for every input)  */ >> ./parts/reset.css
@echo input[type=text],input[type=reset],input[type=password],input[type=search],input[type=email],input[type=tel],input[type=url],input[type=time],input[type=week],input[type=month],input[type=date],input[type=datetime],input[type=datetime-local],input[type=number], >> ./parts/reset.css
@echo input[type=submit],input[type=reset],input[type=color],input[type=file], >> ./parts/reset.css
@echo button,textarea,select { >> ./parts/reset.css
@echo     height:1em; >> ./parts/reset.css
@echo     -webkit-appearance^:none; >> ./parts/reset.css
@echo        -moz-appearance^:none; >> ./parts/reset.css
@echo             appearance^:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* input color width */ >> ./parts/reset.css
@echo input^[type^=color^] { >> ./parts/reset.css
@echo     width^:1em; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* IE clear cross */ >> ./parts/reset.css
@echo input^:^:-ms-clear { >> ./parts/reset.css
@echo     display^:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* details and summary */ >> ./parts/reset.css
@echo details, summary { >> ./parts/reset.css
@echo     -webkit-appearance^:none; >> ./parts/reset.css
@echo     -moz-appearance^:none; >> ./parts/reset.css
@echo     appearance^:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* text size adjusting */ >> ./parts/reset.css
@echo body { >> ./parts/reset.css
@echo     -webkit-text-size-adjust^:100%; >> ./parts/reset.css
@echo        -moz-text-size-adjust^:100%; >> ./parts/reset.css
@echo             text-size-adjust^:100%; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css
@echo /* mark */ >> ./parts/reset.css
@echo mark {background^:none;} >> ./parts/reset.css
@echo. >> ./parts/reset.css
@echo /* Font smoothing */ >> ./parts/reset.css
@echo /**,*^:^:before,*^:^:after,*^:before,*^:after { >> ./parts/reset.css
@echo      -webkit-font-smoothing^: antialiased; >> ./parts/reset.css
@echo     -moz-osx-font-smoothing^: grayscale; >> ./parts/reset.css
@echo }*/ >> ./parts/reset.css
@echo. >> ./parts/reset.css
@echo /* hr */ >> ./parts/reset.css
@echo hr { >> ./parts/reset.css
@echo     height^:1px; >> ./parts/reset.css
@echo     margin^:0;padding^:0; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo.  >> ./parts/reset.css 
@echo /* u */ >> ./parts/reset.css
@echo u { >> ./parts/reset.css
@echo     text-decoration^:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo. >> ./parts/reset.css
@echo /* th */ >> ./parts/reset.css
@echo table th { >> ./parts/reset.css
@echo     text-align^:left; >> ./parts/reset.css
@echo } >> ./parts/reset.css
@echo. >> ./parts/reset.css
@echo /* a */ >> ./parts/reset.css
@echo a { >> ./parts/reset.css
@echo     color^:inherit; >> ./parts/reset.css
@echo     outline^:none; >> ./parts/reset.css
@echo } >> ./parts/reset.css

echo Done
pause
