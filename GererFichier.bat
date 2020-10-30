	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: fichier BATCH pour gérer la création d'un fichier.

@echo off

	rem ancre pour le menu.
:menu

	rem commande pour remettre errorlevel à 0.
cd .

	rem éffacer l'écran et afficher le menu.
cls
echo 1. Créer un nouveau fichier
echo 2. Revenir au menu principal
	

	rem avant de créer la variable, on va faire en sorte que c'est une variable locale
setlocal
	rem demander le choix de l'utilisateur
set /p choixMenu=Veuillez saisir votre choix:

	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :menu

	rem conditions chaînées pour valider le menu.
if not %choixMenu%==1 (
	if not %choixMenu%==2 (
echo Erreur de saisi. Veuillez réessayer.
pause
goto :menu
))

	rem conditions pour les choix du menu.
if %choixMenu%==1 goto :option1
if %choixMenu%==2 goto :retourAuMenuPrincipal

:option1
	rem commande pour remettre errorlevel à 0.
cd .

	rem demander à l'utilisateur le nom du chemin relatif et nom du fichier.
set /p fichier=Veuillez entrer le nom du fichier (avec chemin rélatif au besoin):

	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :option1

if not exist %fichier% goto :fichierInexistant

start notepad %fichier%
pause
goto :menu

:fichierInexistant
type nul > %fichier%
start notepad %fichier%
pause
goto :menu


:retourAuMenuPrincipal
endlocal
pause