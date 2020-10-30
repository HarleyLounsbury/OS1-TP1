	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: fichier BATCH pour cr�er un r�pertoire.

@echo off

	rem ancre pour le menu.
:menu

	rem commande pour remettre errorlevel � 0.
cd .

	rem �ffacer l'�cran et afficher le menu.
cls
echo 1. Cr�er un nouveau r�pertoire
echo 2. Revenir au menu principal
	

	rem avant de cr�er la variable, on va faire en sorte que c'est une variable locale.
setlocal
	rem demander le choix � l'utilisateur.
set /p choixMenu=Veuillez saisir votre choix:

	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :menu

	rem conditions cha�n�es pour valider le menu.
if not %choixMenu%==1 (
	if not %choixMenu%==2 (
echo Erreur de saisi. Veuillez r�essayer.
pause
goto :menu
))

	rem conditions pour les choix du menu.
if %choixMenu%==1 goto :option1
if %choixMenu%==2 goto :retourAuMenuPrincipal


:option1
	rem commande pour remettre errorlevel � 0.
cd .
	rem demander � l'utilisateur le chemin r�latif avec le nom du r�pertoire.
set /p chemin=Veuillez entrer le chemin relatif avec le nom du r�pertoire � cr�er (0 pour quitter):
	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :option1

if %chemin%==0 goto :menu

	rem afficher un message d'erreur si le r�pertoire existe d�j�.
if exist %chemin% goto :repExistant

	rem si le r�pertoire n'existe pas, on va lui cr�er.
if not exist %chemin% md %chemin%
goto :menu
	
:repExistant
echo Erreur: le r�pertoire n'a pas pu �tre cr�er. 
echo Le nom du r�pertoire est d�j� existant.
pause
cls
goto :menu

:retourAuMenuPrincipal
endlocal
pause