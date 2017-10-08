<%@ page import="grails_pointofinterests.ImageController; grails_pointofinterests.Point" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main" />
    <title>Points Of Interests - Home</title>
</head>
<body>

<sec:ifNotLoggedIn>
        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">TP : Plateforme de gestion de points d’intérêts</h1>
            </div>
        </div>
        <!--/.title-->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-primary">
                    <div class="panel-heading">README</div>
                    <div class="panel-body">
                        <div>
                            <p>
                                Nous avons mis en place une plateforme de gestion de points d’intérêts autour du thème : <strong>l'eau</strong>.
                          <br/>
                                Le rendu de projet prend donc la forme de ce site permettant<strong> d’administrer</strong> ou<strong> consulter</strong> son contenu <strong>selon le rôle</strong> de l’utilisateur identifié
                            </p>
                        </div>
                        <hr/>
                        <div>
                            <h3>INITIALISATION</h3>
                                <h5>Groupes et points d'intérêts (cf. Bootstrap.groovy)</h5>
                                <ul>
                                    <li>Génération de <strong style="color: #e14137">3 groupes</strong> contenant chacun <strongstyle="color: red">5 points d'intérêts</strong></li>
                                </ul>
                                <h5>Les différents rôles</h5>
                                <ul>
                                    <li>Génération de 3 types d'utilisateur : 2 <strong style="color: #e14137">Administrateurs</strong> / 5 <strong style="color: #e14137">Modérateurs</strong> / 30 <strong style="color: #e14137">Utilisateurs</strong></li>
                                </ul>
                        </div>
                        <hr/>
                        <div>
                            <h3>MISE EN PLACE DES SESSIONS</h3>
                                <h5>Spring Security</h5>
                                    <ul>
                                        <li>Génération <strong style="color: #e14137">automatique par Spring Security</strong> des classes User/Role/UserRole</li>
                                    </ul>
                                <h5>Rôles (cf. annotations dans contrôleurs et application.groovy)</h5>
                                    <ul>
                                        <li>Les administrateurs pourront modifier n’importe quel profil utilisateur peu importe son rôle et créer/modifier/supprimer des utilisateurs/groupes/pois</li>
                                        <li>Les modérateurs pourront modifier les profils utilisateurs d’un niveau « utilisateur » et créer/modifier/supprimer les groupes et pois</li>
                                        <li>Un utilisateur ayant le rôle « utilisateur » pourra consulter les groupes et les pois et éditer son profil.</li>
                                    </ul>
                                <h5>Authentification</h5>
                                <ul>
                                    <li>Par défaut, le login et le mot de passe sont <strong style="color: #e14137">les mêmes</strong>.</li>
                                    <li>Par défaut, la syntaxe  est le <strong style="color: #e14137">rôle</strong> ("admin", "moderateur", "utilisateur") <strong style="color: #e14137">suivi d'un chiffre</strong> comme ce qui suit :
                                        <br> <i>login : moderateur1 - password: moderateur1</i>
                                    </li>
                                    <li>Option : possibilité de <strong style="color: #e14137">s'inscrire</strong> via le formulaire correspondant et c'est donc le <strong style="color: #e14137">rôle d'utilisateur qui est attribué automatiquement</strong></li>
                                </ul>
                                <h5>URLMapping</h5>
                                <ul>
                                    <li>Toutes les redirections sont mis en place de la manière la plus cohérente possible
                                    <br>Un <strong style="color: #e14137">paramètre est envoyé via URL</strong> pour une redirection correcte sur <strong style="color: #e14137">l'objet en cours de traitement</strong> après chaque ajout/modification/suppression</li>
                                </ul>
                        </div>
                        <hr/>
                        <div>
                            <h3>GESTION DU MODELE</h3>
                            <p>Lors de l'initialisation nous avons tenté de montrer que <strong style="color: #e14137">le modèle est en cohérence avec les contraintes exposées</strong></p>

                            <h5>Groupes "/groupe/"</h5>
                                    <ul>
                                        <li>Création d'un Groupe : possibilité de <strong style="color: red">rattacher plusieurs POIs et Images</strong>
                                        <li>Modification d'un Groupe : possibilité d'<strong style="color: red">affecter plusieurs POIs et Images</strong> (select à choix multiples ou lien de création)
                                    <br>et/ou <strong style="color: red">supprimer des POIs et Images déjà affectés</strong></li>
                                        <li>Affichage de la liste des Groupes sur une map</li>
                                        <li>Affichage des détails d'un Groupe, ses images et des POIs lui correspondant sur une map</li>
                                        <li>Suppression d'un Groupe et par conséquent suppression de ses références à d'autres domaines</li>
                                    </ul>
                                <h5>POIs "/point/"</h5>
                                    <ul>
                                        <li>Création d'un POI : possibilité de  <strong style="color: red">rattacher plusieurs Groupes et Images</strong> (select à choix multiples ou lien de création)</li>
                                        <li>Modification d'un POI : possibilité d'<strong style="color: red">affecter plusieurs Groupes, Localisations et Images</strong> (select à choix multiples ou lien de création)
                                        <br>et/ou <strong style="color: red">supprimer des POIs, Emplacements et Images déjà affectés</strong></li>
                                        <li>Affichage de la liste des Groupes sur une map</li>
                                        <li>Affichage d'un POI, des Images et de sa Localisation sur une map</li>
                                        <li>Suppression d'un POI et par conséquent suppression de ses références à d'autres domaines</li>
                                    </ul>
                                <h5>Localisations "/location/"</h5>
                                <ul>
                                    <li>Création d'une Localisation : possibilité de  <strong style="color: red">rattacher plusieurs </strong> Groupes et Images (select à choix multiples ou lien de création)</li>
                                    <li>Modification d'une Localisation : possibilité d' <strong style="color: red">affecter un longitude et latitude directement via la map </strong>, le marqueur est draggable</li>
                                    <li>Affichage d'une Localisation  <strong style="color: red">sur une map </strong> : le marqueur n'est pas draggable</li>
                                    <li>Suppression d'un Localisation</li>
                                </ul>
                                <h5>Images "/image/"</h5>
                                <ul>
                                    <li>Les images fournis dans l'asset <strong style="color: red">sont transférés automatiquement</strong> sur le serveur Apache <strong style="color: red">dès l'initialisation du projet</strong></li>
                                    <li>Les images uploadé via les différents formulaires <strong style="color: red">sont enregistrées automatiquement</strong> dans le serveur web Apache</li>
                                    <li>Le fichier de configuration application.yml permet de <strong style="color: red">reconstruire le path et l’url à la volée</strong> :
                                        <br/><i>Exemple</i>
                                        <br/><i>server :</i>
                                        <br/><i>uploadImage: '/Applications/MAMP/htdocs/images/':</i>
                                        <br/><i>pathServer: 'http://localhost:8081/'</i>
                                    </li>
                                </ul>
                                <h5>Users "/user/"</h5>
                                    <ul>
                                        <li>Création et modification d'un utilisateur (rôle, identifiant et mot de passe)</li>
                                        <li>Affichaged'une <strong style="color: red">liste d'utilisateurs</strong> ou d'un <strong style="color: red">profil</strong> utilisateur (rôle, identifiant et mot de passe)</li>
                                        <li>Suppression d'un profil utilisateur</li>
                                    </ul>

                        </div>
                        <hr/>
                        <div>
                            <h3>BONUS ACCOMPLIS</h3>
                            <ul>
                                <li>Uploader les fichiers en faisant un simple <strong style="color: red">drag’n’drop en Ajax</strong> du fichier sur le champ en question - visible sur "/image/create"</li>
                                <li>Permettre que la liste des POIs au sein d’un Groupe soit <strong style="color: red">modifiable entre Groupes</strong> directement en <strong style="color: red">drag’n’drop Ajax</strong> - visible sur "/groupe/index"</li>
                                <li>Mettre en place une <strong style="color: red">map</strong> au niveau de la gestion des Groupes et POIs
                                <br>Pour information : lors de l'affichage, le marqueur est non draggable contrairement à l'étape de modification</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>

        <!--/.title-->
        <div class="row" style="margin-top: 15px">
            <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">Aqua Of Interests
                            <span class="pull-right clickable panel-toggle panel-collapse"><em class="fa fa-toggle-down"></em></span></div>
                        <div class="panel-body" style="display: block;">
                            <p>L’eau est à l’origine de la vie sur terre.
                                <br>Elle est indispensable à notre corps humain et à tout ce qui nous entoure.
                                <br> Ce besoin vital est "domestiqué" dans les pays développés.
                                <br>Il est devenu un confort indispensable dans la vie de tous les jours.
                                <br>Pour s’en rendre compte une coupure d’eau au robinet de quelques heures devient vite un inconvénient majeur !
                                <br>
                                <br>Cette plateforme permet donc de répertorier des points d'intérêts autour de l'eau en fonction d'une région ou encore d'un thème.
                                <br>Laissez place à votre imagination :)
                            </p>
                        </div>
                    </div>
                </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="1500" style="height: 500px">

                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                        <div class="item active">
                          <img style="display:block;
                          object-fit: cover;
                          height:500px !important;
                          line-height: 1;" src="${grailsApplication.config.server.pathServer}/carousel_index/1.jpg"/></a>
                        </div>
                        <g:each in="${(2..7)}" var="id">
                            <div class="item">
                                <img style="display:block;
                                object-fit: cover;
                                height:500px !important;
                                line-height: 1;" src="${grailsApplication.config.server.pathServer}/carousel_index/${id}.jpg"/>
                            </div>
                        </g:each>

                    </div>
                    <!-- Wrapper for slides -->

                            <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>
    </sec:ifLoggedIn>

</body>
</html>
