	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: fichier BATCH pour créer un répertoire.

@echo off

	rem ancre pour le menu.
:menu

	rem commande pour remettre errorlevel à 0.
cd .

	rem éffacer l'écran et afficher le menu.
cls
echo 1. Créer un nouveau répertoire
echo 2. Revenir au menu principal
	

	rem avant de créer la variable, on va faire en sorte que c'est une variable locale.
setlocal
	rem demander le choix à l'utilisateur.
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
	rem demander à l'utilisateur le chemin rélatif avec le nom du répertoire.
set /p chemin=Veuillez entrer le chemin relatif avec le nom du répertoire à créer (0 pour quitter):
	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :option1

if %chemin%==0 goto :menu

	rem afficher un message d'erreur si le répertoire existe déjà.
if exist %chemin% goto :repExistant

	rem si le répertoire n'existe pas, on va lui créer.
if not exist %chemin% md %chemin%
goto :menu
	
:repExistant
echo Erreur: le répertoire n'a pas pu être créer. 
echo Le nom du répertoire est déjà existant.
pause
cls
goto :menu

:retourAuMenuPrincipal
endlocal
pause