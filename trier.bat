	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: Fichier BATCH pour trier le contenu d'un fichier.

@echo off

:debut
	rem éffacer l'écran et demander le nom du fichier.
cls
setlocal

	rem commande pour remettre errorlevel à 0.
cd .

set /p chemin=Veuillez entrer le nom du fichier à trier, avec chemin relatif au besoin (0 pur quitter): 
if errorlevel 1 goto :debut

if %chemin%==0 goto :fin

	rem vérifier l'existance du fichier.
if not exist %chemin% goto :fichierInexistant

:menu
cd.
	rem afficher le menu d'options et demander à l'utilisateur son choix.
echo 1. Trier le fichier dans l'ordre croissant
echo 2. Trier le fichier dans l'ordre décroissant
set /p choixMenu=Veuillez saisir votre choix:
if errorlevel 1 goto :menu


	rem conditions chaînées pour valider le menu.
if not %choixMenu%==1 (
	if not %choixMenu%==2 (
echo Erreur de saisi. Veuillez réessayer.
pause
goto :menu
))

if %choixMenu%==1 sort %chemin% /o %chemin%_croissant.txt && goto :fin
if %choixMenu%==2 sort /r %chemin% /o %chemin%_decroissant.txt && goto :fin

:fichierInexistant
echo Erreur: le fichier n'a pu être trié.
echo Le fichier n'existe pas.

:fin
endlocal
pause



