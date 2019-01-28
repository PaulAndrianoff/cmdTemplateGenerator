@echo off

REM set name=test
set /p name=What is the folder name:
mkdir %name%

REM goto folder root
cd %name%
md src views

REM Create readme file
@echo # %name% >> ./readme.md

REM Create .gitignore
@echo Help https://www.atlassian.com/git/tutorials/saving-changes/gitignore >> .gitignore

REM Create index.html
@echo ^<!DOCTYPE html^> >> ./index.html
@echo ^<html lang="en"^> >> ./index.html
@echo ^<head^> >> ./index.html
@echo     ^<meta charset="UTF-8"^> >> ./index.html
@echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> ./index.html
@echo     ^<meta http-equiv="X-UA-Compatible" content="ie=edge"^> >> ./index.html
@echo     ^<link rel="stylesheet" href="src/styles/style.css"^> >> ./index.html
@echo     ^<title^>My title^<^/title^> >> ./index.html
@echo ^<^/head^> >> ./index.html
@echo ^<body^> >> ./index.html
@echo     ^<h1^>Hello world^<^/h1^> >> ./index.html

@echo     ^<script src="src/scripts/main.js"^>^<^/script^> >> ./index.html
@echo ^<^/body^> >> ./index.html
@echo ^<^/html^> >> ./index.html

REM Create src folder content
cd src
md styles scripts images

REM Create script.js
@echo console.log("Hello world"); >> ./scripts/main.js

REM Create style.css
@echo ^@import "parts/main.css"; >> ./styles/style.css

cd styles
mkdir parts

REM Create parts
@echo body { >> ./parts/main.css
@echo     background: #efefef; >> ./parts/main.css
@echo     color: red; >> ./parts/main.css
@echo } >> ./parts/main.css


echo Done
pause
