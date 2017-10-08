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
                                Nous avons mis en place une plateforme de gestion de points d’intérêts au sens large.
                          <br/>
                                Le rendu de projet prend donc la forme de ce site permettant d’administrer ou consulter son contenu selon le rôle de l’utilisateur identifié
                            </p>
                        </div>
                        <hr/>
                        <div>
                            <h3>INITIALISATION</h3>
                                <h5>Groupes et points d'intérêts</h5>
                                <ul>
                                    <li>Génération de 3 groupes contenant chacun 5 points d'intérêts
                                </ul>
                                <h5>Les différents rôles</h5>
                                <ul>
                                    <li>Génération de 3 types d'utilisateur : 1 Administrateur/ 3 Modérateurs / 10 Utilisateurs</li>
                                </ul>
                        </div>
                        <hr/>
                        <div>
                            <h3>MISE EN PLACE DES SESSIONS</h3>
                                <h5>Spring Security</h5>
                                    <ul>
                                        <li>Génération des classes User/Role/UserRole</li>
                                    </ul>
                                <h5>Rôles</h5>
                                    <ul>
                                        <li>Les administrateurs pourront modifier n’importe quel profil utilisateur peu importe son rôle et créer/modifier/supprimer des utilisateurs/groupes/pois</li>
                                        <li>Les modérateurs pourront modifier les profils utilisateurs d’un niveau « utilisateur » et créer/modifier/supprimer les groupes et pois</li>
                                        <li>Un utilisateur ayant le rôle « utilisateur » pourra consulter les groupes et les pois et éditer son profil.</li>
                                    </ul>
                                <h5>URLMapping</h5>
                                    <ul>
                                        <li>//TODO Redirections</li>
                                        <li>//TODO Clean URLs</li>
                                    </ul>
                        </div>
                        <hr/>
                        <div>
                            <h3>GESTION DU MODELE</h3>
                                <h5>Groupe</h5>
                                    <ul>
                                        <li>Création et modification d'un groupe</li>
                                        <li>Affichage des détails d'un groupe et des POIs lui correspondant sur une map</li>
                                        <li>Suppression d'un groupe et de ses références à d'autres domaines</li>
                                    </ul>
                                <h5>POIs</h5>
                                    <ul>
                                        <li>Création et modification d'un POI</li>
                                        <li>Affichage d'un POI et de sa position sur une map </li>
                                        <li>Suppression d'un POI et de ses références à d'autres domaines</li>
                                    </ul>
                                <h5>Users</h5>
                                    <ul>
                                        <li>Création et modification d'un utilisateur (rôle, identifiant et mot de passe)</li>
                                        <li>Affichage d'une liste d'utilisateur ou d'un profil utilisateur (rôle, identifiant et mot de passe)</li>
                                        <li>Suppression d'un profil utilisateur</li>
                                    </ul>
                                <h5>Images</h5>
                                    <ul>
                                        <li>Les images fournis dans l'asset sont transférés sur le serveur dès l'initialisation du projet</li>
                                        <li>Les images uploadé via les différents formulaires sont enregistrés dans notre serveur web Apache</li>
                                        <li>Le fichier de configuration permet de reconstruire le path et l’url à la volée
                                        <br/>updateFolder:
                                        <br/>urlImage:
                                        </li>
                                    </ul>
                        </div>
                        <hr/>
                        <div>
                            <h3>BONUS</h3>
                            <ul>
                                <li>Uploader les fichiers en Ajax en faisant un simple drag’n’drop du fichier sur le champ en question</li>
                                <li>Permettre que liste des POIs au sein d’un Groupe soit modifiable directement en drag’n’drop Ajax </li>
                                <li>Mettre en place une map au niveau de la gestion des Groupes et POIs</li>
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
                        <div class="panel-body" style="display: none;">
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
