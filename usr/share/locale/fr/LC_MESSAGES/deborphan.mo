��    E      D  a   l      �  4   �  &   &     M  �   j  $   �  O     "   i      �  #   �  C   �  4       J	  4   b	  =   �	  A   �	  2   
  ;   J
  9   �
  ?   �
  @      B   A  :   �  A   �  :     :   <  6   w  :   �  :   �  <   $  :   a  G   �  P   �  D   5  2   z     �     �  5   �  +     ,   K  4   x  /   �  9   �  :     "   R     u  :   �  :   �  9     7   ;  1   s     �  1   �  !   �       {   9     �     �     �        ,     =   9  .   w  J   �     �  *   �  �   %  9   �  !     v  (  ?   �  "   �  0     �   3  9     |   S  6   �  1     8   9  c   r  Y  �     0  \   O  p   �  x     H   �  v   �  x   V  q   �  Q   A  P   �  M   �  w   2  H   �  K   �  J   ?   K   �   K   �   M   "!  K   p!  �   �!  (  M"  w   v#  <   �#  ,   +$  t   X$  f   �$  d   4%  c   �%  h   �%  i   f&  3   �&  s   '  4   x'     �'  �   �'  t   V(  U   �(  l   !)  -   �)  .   �)  a   �)  8   M*  6   �*  �   �*     e+  (   z+  '   �+     �+  A   �+  N   ,  V   n,  f   �,     ,-  E   4-  �   z-  C   2.  $   v.        %       5              '       ,       !      =                     3         E          )             /              0       8   *   &   D             ?            -             6   C      2      (       ;   .          #       1       
           >       A   4   <                 "      	   B   $   :                     9       7       @         +    
See also: deborphan(1), orphaner(8)
Report bugs to: 
The following options are available:
 "apt" got removed.  Exiting. "apt" is not installed, broken dependencies found or could not open lock file, are you root?  Printing "apt-get" commandline and exiting: "apt-get" returned with exitcode %s. "apt-get" tries to remove more packages than requested by "orphaner".  Exiting. "deborphan" got removed.  Exiting. "deborphan" returned with error. "dialog" returned with exitcode %s. "find-circular" is currently not supported by "orphaner".  Exiting. %s %s - Find packages without other packages depending on them
Distributed under the terms of the Artistic License.

THIS PACKAGE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 %s: Invalid option: %s. %s: You need "dialog" in $PATH to run this frontend. --df-keep                   Read debfoster's "keepers" file.
 --find-config               Find "orphaned" configuration files.
 --guess-all                 Try all of the above.
 --guess-common              Try to report common packages.
 --guess-data                Try to report data packages.
 --guess-debug               Try to report debugging libraries.
 --guess-dev                 Try to report development packages.
 --guess-doc                 Try to report documentation packages.
 --guess-dummy               Try to report dummy packages.
 --guess-interpreters        Try to report interpreter libraries.
 --guess-kernel              Try to report kernel modules.
 --guess-mono                Try to report mono libraries.
 --guess-only                Use --guess options only.
 --guess-perl                Try to report perl libraries.
 --guess-pike                Try to report pike libraries.
 --guess-python              Try to report python libraries.
 --guess-ruby                Try to report ruby libraries.
 --guess-section             Try to report libraries in wrong sections.
 --libdevel                  Search in libdevel in addition to libs and oldlibs.
 --no-df-keep                Do not read debfoster's "keepers" file.
 --no-show-section           Do not show sections.
 -A PKGS.. Never report PKGS.
 -H        Ignore hold flags.
 -L        List the packages that are never reported.
 -P        Show priority of packages found.
 -R PKGS.. Remove PKGS from the "keep" file.
 -Z        Remove all packages from the "keep" file.
 -a        Compare all packages, not just libs.
 -d        Show dependencies for packages that have them.
 -e LIST   Work as if packages in LIST were not installed.
 -f FILE   Use FILE as statusfile.
 -h        This help.
 -k FILE   Use FILE to get/store info about kept packages.
 -n        Disable checks for `recommends' and `suggests'.
 -n        Enable checks for `recommends' and `suggests'.
 -p PRIOR  Select only packages with priority >= PRIOR.
 -s        Show the sections the packages are in.
 -v        Version information.
 -z        Show installed size of packages found.
 Disable checks for `recommends'.
 Disable checks for `suggests'.
 Explicitly specified status file or requested calling "apt-get" to be skipped.  Printing "apt-get" commandline and exiting: Invalid basename: %s. No orphaned packages found. Press enter to continue. Removing %s Screen too small or set $LINES and $COLUMNS. See orphaner(8) and deborphan(1) for a list of valid options. Select packages for removal or cancel to quit: Select packages that should never be recommended for removal in deborphan: Simulate Status file is probably invalid. Exiting.
 The status file is in an improper state.
One or more packages are marked as half-installed, half-configured,
unpacked, triggers-awaited or triggers-pending. Exiting.
 Usage: %s [--help|--purge|--skip-apt] [deborphan options] Usage: %s [OPTIONS] [PACKAGE]...
 Project-Id-Version: deborphan 1.7.28
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2012-06-30 18:50+0000
PO-Revision-Date: 2009-03-06 10:23+0100
Last-Translator: Jean-Luc Coulon (f5ibh) <jean-luc.coulon@wanadoo.fr>
Language-Team: French <debian-l10n-french@lists.debian.org>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Voir aussi : deborphan(1), orphaner(8)
Signaler les bogues à 
Liste des options disponibles :
 « apt » a été supprimé. Fin du programme. « apt » n'est pas installé, des dépendances cassées ont été trouvées ou il n'est pas possible d'ouvrir le fichier lock, êtes-vous administrateur ? Affichage de la ligne de commande « apt-get » et fin du programme. « apt-get » s'est terminé avec un code le retour %s. « apt-get » a tenté de supprimer davantage de paquets que ce qui était demandé par « orphaner ». Fin du programme. « deborphan » a été supprimé. Fin du programme. « deborphan » s'est terminé avec une erreur. « dialog » s'est terminé avec le code de retour %s. « find-circular » n'est pas pris en compte actuellement par « orphaner ». Fin du programme. %s %s - Chercher les paquets dont aucun paquet ne dépend
Distribué selon les termes de la Licence Artistique (Artistic Licence).

CE PAQUET EST FOURNI EN L'ÉTAT ET SANS AUCUNE GARANTIE
EXPRESSE OU IMPLICITE, NOTAMMENT, ET SANS LIMITATION, LES
GARANTIES IMPLICITES D'UNE POSSIBLE VALEUR MARCHANDE OU D'UNE
ADÉQUATION A UN BESOIN PARTICULIER.
 %s : option incorrecte : %s. %s : « dialog » doit être accessible dans $PATH pour pouvoir utiliser cette interface. --df-keep,                    Lire le fichier des « maintiens » de
                              debfoster.
 --find-config,                Rechercher les fichiers de configuration
                              « orphelins ».
 --guess-all,                  Essayer toutes les options précédentes.
 --guess-common,               Essayer de signaler les paquets communs
                              (« common »).
 --guess-data,                 Essayer de signaler les paquets de données
                              (« data »).
 --guess-debug,                Essayer de signaler les bibliothèques de
                              débogage.
 --guess-dev,                  Essayer de signaler les paquets de développement.
 --guess-doc,                  Essayer de signaler les paquets de documentation.
 --guess-dummy,                Essayer de signaler les paquets « dummy ».
 --guess-interpreters,         Essayer de signaler les bibliothèques de
                              l'interpréteur.
 --guess-kernel,               Essayer de signaler les modules du noyau.
 --guess-mono,                 Essayer de signaler les bibliothèques mono.
 --guess-only,                 N'utiliser que les options « --guess ».
 --guess-perl,                 Essayer de signaler les bibliothèques Perl.
 --guess-pike,                 Essayer de signaler les bibliothèques Pike.
 --guess-python,               Essayer de signaler les bibliothèques Python.
 --guess-ruby,                 Essayer de signaler les bibliothèques Ruby.
 --guess-section,              Essayer de signaler les bibliothèques qui se
                              trouvent dans des sections erronées.
 --libdevel,                   Effectuer les recherches dans les bibliothèques
                              de développement (« libdevel ») en plus des
                              bibliothèques (« libs ») et bibliothèques
                              périmées (« oldlibs »).
 --no-df-keep,                 Ne pas lire le fichier des « maintiens » de
                              debfoster.
 --no-show-section             Ne pas afficher les sections.
 -A PAQUETS  Ne jamais signaler les PAQUETS.
 -H          Ignorer l'indicateur de maintien dans la version
                              actuelle (« hold »).
 -L          Afficher la liste des paquets qui ne sont jamais
                              signalés.
 -P          Afficher la priorité des paquets qui ont été
                              trouvés.
 -R PAQUETS  Supprimer les PAQUETS de la liste des paquets
                              maintenus.
 -Z          Supprimer tous les paquets de la liste des paquets
                              maintenus.
 -a          Comparer tous les paquets et pas seulement
                              les bibliothèques.
 -d          Afficher les dépendances des paquets.
 -e LISTE    Fonctionne comme si les paquets dans la LISTE
                              n'étaient pas installés.
 -f FICHIER  Utiliser FICHIER comme fichier d'état.
 -h          Ce texte d'aide.
 -k FICHIER  Utiliser FICHIER pour chercher et enregistrer les
                              informations à propos des paquets maintenus.
 -n          Supprimer les vérifications pour « recommande » et
                              « suggère ».
 -n         Autoriser les vérifications pour « recommande » et « suggère ».
 -p PRIOR    Sélectionner uniquement les paquets avec une
                              priorité >= PRIOR.
 -s          Afficher la section des paquets.
 -v          Afficher la version du programme.
 -z          Afficher la taille des paquets qui ont été
                              trouvés.
   Supprimer les vérifications pour « recommande ».
   Supprimer les vérifications pour « suggère ».
 Le fichier d'état explicitement indiqué ou demandant l'appel à « apt-get » va être sauté. Affichage de la ligne de commande « apt-get » et fin du programme. Nom incorrect : %s. Aucun paquet orphelin n'a été trouvé. Presser « Entrée » pour continuer. Suppression de %s L'écran est trop petit, vous pouvez modifier $LINES et $COLUMNS. Voir orphaner(8) et deborphan(1) pour obtenir une liste des options possibles. Sélectionner les paquets à supprimer ou « Annuler » pour quitter le programme : Sélectionner les paquets qui ne doivent jamais être proposés par deborphan pour être supprimés : Simuler L'état du fichier n'est probablement pas valable. Fin du programme.
 Le fichier statut est dans un état impropre.
Un ou plusieurs paquets sont marqués half-installed, half-configured,
unpacked, triggers-awaited ou triggers-pending. Fin du programme.
 Syntaxe : %s [--help | --purge]i|--skip-apt [options de deborphan] Syntaxe : %s [OPTIONS] [PAQUET]...
 