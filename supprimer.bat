	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: Fichier BATCH pour supprimer un fichier.

@echo off

	rem avant de créer la variable, on va faire en sorte que c'est une variable locale.
setlocal

:demanderFichier
	rem demander le nom du fichier à supprimer.
cd .
set /p nomFichier=Veuillez entrer le nom du fichier, avec chemin rélatif au besoin (0 pour quitter):
if errorlevel 1 goto :demanderFichier

if %nomFichier%==0 goto :fin

if exist %nomFichier% (
	del /p %nomFichier%
	goto :fin
)

echo Le fichier n'a pas pu être supprimer.
echo Le fichier n'existe pas.

:fin
endlocal
pause





	



