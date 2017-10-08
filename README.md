# GRAILS_PointOfInterests

Nous avons mis en place une plateforme de gestion de points d’intérêts autour du thème : l'eau. 
Le rendu de projet prend donc la forme de ce site permettant d’administrer ou consulter son contenu selon le rôle de l’utilisateur identifié

## INITIALISATION

### Groupes et points d'intérêts (cf. Bootstrap.groovy)
- Génération de 3 groupes contenant chacun 5 points d'intérêts

### Les différents rôles
- Génération de 3 types d'utilisateur : 2 Administrateurs / 5 Modérateurs / 30 Utilisateurs

## MISE EN PLACE DES SESSIONS

### Spring Security
- Génération automatique par Spring Security des classes User/Role/UserRole

### Rôles (cf. annotations dans contrôleurs et application.groovy)
- Les administrateurs pourront modifier n’importe quel profil utilisateur peu importe son rôle et créer/modifier/supprimer des utilisateurs/groupes/pois
- Les modérateurs pourront modifier les profils utilisateurs d’un niveau « utilisateur » et créer/modifier/supprimer les groupes et pois
- Un utilisateur ayant le rôle « utilisateur » pourra consulter les groupes et les pois et éditer son profil.

### Authentification
- Par défaut, le login et le mot de passe sont les mêmes.
- Par défaut, la syntaxe est le rôle ("admin", "moderateur", "utilisateur") suivi d'un chiffre comme ce qui suit : 
``` 
login : moderateur1 - password: moderateur1
``` 
- Option : possibilité de s'inscrire via le formulaire correspondant et c'est donc le rôle d'utilisateur qui est attribué automatiquement

### URLMapping
- Toutes les redirections sont mis en place de la manière la plus cohérente possible 
- Un paramètre est envoyé via URL pour une redirection correcte sur l'objet en cours de traitement après chaque ajout/modification/suppression

## GESTION DU MODELE
Lors de l'initialisation nous avons tenté de montrer que le modèle est en cohérence avec les contraintes exposées

### Groupes "/groupe/"
- Création d'un Groupe : possibilité de rattacher plusieurs POIs et Images
- Modification d'un Groupe : possibilité d'affecter plusieurs POIs et Images (select à choix multiples ou lien de création) 
et/ou supprimer des POIs et Images déjà affectés
- Affichage de la liste des Groupes sur une map
- Affichage des détails d'un Groupe, ses images et des POIs lui correspondant sur une map
- Suppression d'un Groupe et par conséquent suppression de ses références à d'autres domaines

### POIs "/point/"
- Création d'un POI : possibilité de rattacher plusieurs Groupes et Images (select à choix multiples ou lien de création)
- Modification d'un POI : possibilité d'affecter plusieurs Groupes, Localisations et Images (select à choix multiples ou lien de création) 
et/ou supprimer des POIs, Emplacements et Images déjà affectés
- Affichage de la liste des Groupes sur une map
- Affichage d'un POI, des Images et de sa Localisation sur une map
- Suppression d'un POI et par conséquent suppression de ses références à d'autres domaines

### Localisations "/location/"
- Création d'une Localisation : possibilité de rattacher plusieurs Groupes et Images (select à choix multiples ou lien de création)
- Modification d'une Localisation : possibilité d' affecter un longitude et latitude directement via la map , le marqueur est draggable
- Affichage d'une Localisation sur une map : le marqueur n'est pas draggable
- Suppression d'un Localisation

### Images "/image/"
- Les images fournis dans l'asset sont transférés automatiquement sur le serveur Apache dès l'initialisation du projet
- Les images uploadé via les différents formulaires sont enregistrées automatiquement dans le serveur web Apache
- Le fichier de configuration application.yml permet de reconstruire le path et l’url à la volée au niveau de : 
``` 
    server : 
        uploadImage: '/Applications/MAMP/htdocs/images/': 
        pathServer: 'http://localhost:8081/'
``` 

### Users "/user/"
- Création et modification d'un utilisateur (rôle, identifiant et mot de passe)
- Affichage d'une liste d'utilisateurs ou d'un profil utilisateur (rôle, identifiant et mot de passe)
- Suppression d'un profil utilisateur

## BONUS ACCOMPLIS
- Uploader les fichiers en faisant un simple drag’n’drop en Ajax du fichier sur le champ en question - visible sur "/image/create"
- Permettre que la liste des POIs au sein d’un Groupe soit modifiable entre Groupes directement en drag’n’drop Ajax - visible sur "/groupe/index"
- Mettre en place une map au niveau de la gestion des Groupes et POIs (pour information : lors de l'affichage, le marqueur est non draggable contrairement à l'étape de modification)
