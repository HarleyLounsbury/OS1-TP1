	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: fichier BATCH pour afficher le contenu d'un r�pertoire.

@echo off

	rem ancre pour le menu.
:menu
	rem commande pour remettre errorlevel � 0.
cd .
	rem �ffacer l'�cran et afficher le menu.
cls
echo 1. Contenu du r�pertoire
echo 2. Arborescence
echo 3. Revenir au menu principal

	rem avant de cr�er la (ou les) variable, on va faire en sorte que c'est une variable locale.
setlocal

	rem demander le choix de l'utilisateur.
set /p choixMenu=Veuillez saisir votre choix:

	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :menu

	rem conditions cha�n�es pour valider le menu.
if not %choixMenu%==1 (
	if not %choixMenu%==2 (
		if not %choixMenu%==3 (
echo Erreur de saisi. Veuillez r�essayer.
pause
goto :menu
)))

	rem conditions pour les choix du menu.
if %choixMenu%==1 goto :option1
if %choixMenu%==2 goto :option2
if %choixMenu%==3 goto :retourAuMenuPrincipal


:option1
	rem demander � l'utilisateur le chemin relatif du r�pertoire � afficher.
set /p chemin=Veuillez entrer le chemin relatif du r�pertoire (0 pour quitter):

if %chemin%==0 goto :menu

	rem afficher un message d'erreur si le r�pertoire n'existe pas.
if not exist %chemin% goto :repInexistant

	rem afficher le contenu du r�pertoire.
dir /ON  %chemin%

pause
goto :menu


:option2
	rem demander � l'utilisateur le chemin relatif du r�pertoire � afficher.
set /p chemin=Veuillez entrer le chemin relatif du r�pertoire (0 pour quitter):

if %chemin%==0 goto :menu

	rem afficher un message d'erreur si le r�pertoire n'existe pas.
if not exist %chemin% goto :repInexistant

	rem afficher l'arborescence
tree %chemin%

pause
goto :menu


:repInexistant
echo Erreur: le r�pertoire n'a pas pu �tre affich�.
echo Le r�pertoire n'existe pas.
pause
cls
goto :menu

:retourAuMenuPrincipal
endlocal
pause