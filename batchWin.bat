	rem Auteur: Harley Lounsbury
	rem Date: 10-03-2019
	
	rem But: Fichier BATCH principal pour un programme qui g�re des fichiers et dossiers.

@echo off

	rem afficher les caract�res accentu�es.
chcp 1252

	rem changer la couleur du fond et du texte.
color 02

	rem Ancre pour le menu principal.
:menuPrincipal

	rem commande pour remettre errorlevel � 0.
cd .

	rem �ffacer l'�cran et afficher le menu.
cls
echo Bienvenue au TP-1!

echo.

echo A. Cr�er un r�pertoire
echo B. Afficher le contenu d'un r�pertoire
echo C. G�rer des fichiers
echo D. Supprimer un fichier
echo E. Trier le contenu d'un fichier
echo F. Quitter

	rem avant de cr�er la variable, on va faire en sorte que c'est une variable locale.
setlocal
	
	rem avant de demander le choix de l'utilisteur, on va initialiser la variable � 0, une valeur arbitraire.
	rem cela va limiter des erreurs de saisi, d'une mani�re preventative.
	rem si on reviens au menu d'ailleurs dans le programme, on ne va pas garder l'ancienne valeur.
set choixMenu=0

	rem Demander le choix � l'utilisateur.
set /p choixMenu=Veuillez saisir votre choix:
	rem dans le cas que l'utilisateur entre rien.
if errorlevel 1 goto :menuPrincipal

	rem conditions cha�n�es pour assurer que l'utilisateur a bien choisi parmi les options offertes.
if not %choixMenu%==A (
	if not %choixMenu%==a (
		if not %choixMenu%==B (
			if not %choixMenu%==b (
				if not %choixMenu%==C (
					if not %choixMenu%==c (
						if not %choixMenu%==D (
							if not %choixMenu%==d (
								if not %choixMenu%==E (
									if not %choixMenu%==e (
										if not %choixMenu%==F (
											if not %choixMenu%==f (
echo Erreur de saisi
pause
goto :menuPrincipal

))))))))))))

echo.

	rem conditions pour le choix du menu.
	rem Majuscule
if %choixMenu%==A call creerRep.bat && goto :menuPrincipal
if %choixMenu%==B call affArbre.bat && goto :menuPrincipal
if %choixMenu%==C call GererFichier.bat && goto :menuPrincipal
if %choixMenu%==D call supprimer.bat && goto :menuPrincipal
if %choixMenu%==E call trier.bat && goto :menuPrincipal
if %choixMenu%==F echo Script r�alis� par Harley Lounsbury && pause %% goto :finScript

	rem Minuscule
if %choixMenu%==a call creerRep.bat && goto :menuPrincipal
if %choixMenu%==b call affArbre.bat && goto :menuPrincipal
if %choixMenu%==c call GererFichier.bat && goto :menuPrincipal
if %choixMenu%==d call supprimer.bat && goto :menuPrincipal
if %choixMenu%==e call trier.bat && goto :menuPrincipal
if %choixMenu%==f echo Script r�alis� par Harley Lounsbury && pause %% goto :finScript

	rem retourne au menu principale apr�s que l'utilisateur a �ffectu� ses op�rations.
if %choixMenu%==A goto :menuPrincipal
if %choixMenu%==B goto :menuPrincipal
if %choixMenu%==C goto :menuPrincipal
if %choixMenu%==D goto :menuPrincipal
if %choixMenu%==E goto :menuPrincipal
if %choixMenu%==a goto :menuPrincipal
if %choixMenu%==b goto :menuPrincipal
if %choixMenu%==c goto :menuPrincipal
if %choixMenu%==d goto :menuPrincipal
if %choixMenu%==e goto :menuPrincipal
if %choixMenu%==0 goto :menuPrincipal

	rem retourne aux couleurs d'origine de powershell.
:finScript
echo.
endlocal
color 17
cls



