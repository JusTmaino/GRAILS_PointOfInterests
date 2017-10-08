package grails_pointofinterests

import grails.util.Environment;
import org.apache.commons.io.FileUtils;


class BootStrap {
    def grailsApplication
    def init = { servletContext ->

        // Transfert du répertoire /assets sur le serveur Apache
        String sourceDir = System.getProperty("user.dir")+"/grails-app/assets/images"
        def destinationDir = grailsApplication.config.server.uploadImage
        def srcDir = new File(sourceDir)
        def destiDir = new File(destinationDir)
        FileUtils.copyDirectory(srcDir,destiDir)

///////////////
// USERS
///////////////

        // 2 ADMINS
        (1 .. 2).each {
            int i ->
                def administrateurRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role('ROLE_ADMIN').save(flush: true, failOnError: true);
                def administrateurUser = new User('admin'+i, 'admin'+i).save(flush: true, failOnError: true);
                UserRole.create(administrateurUser, administrateurRole, true);
        }

        // 5 MODERATORS
        (1 .. 5).each {
            int i ->
                def moderateurRole = Role.findByAuthority('ROLE_MOD') ?: new Role('ROLE_MOD').save(flush: true, failOnError: true);
                def moderateurUser = new User('moderateur'+i, 'moderateur'+i).save(flush: true, failOnError: true);
                UserRole.create(moderateurUser, moderateurRole, true);
        }

        // 30 USERS
        (1 .. 30).each {
            int i ->
                def utilisateurRole = Role.findByAuthority('ROLE_USER') ?: new Role('ROLE_USER').save(flush: true, failOnError: true);
                def utilisateurUser = new User('utilisateur'+i, 'utilisateur'+i).save(flush: true, failOnError: true);
                UserRole.create(utilisateurUser, utilisateurRole, true);
        }


 ///////////////
// GROUPS & POIS
///////////////

        // GROUPE 1 : France
        def groupe1 = new Groupe(name: 'France', description: 'Points d\'eau en France').save(flush: true, failOnError: true)
        def groupe1_img = new Image("groupe1.jpg")
        groupe1.addToImages(groupe1_img).save(flush: true, failOnError: true)

            // POI 1 : La Seine
            def g1point1 = new Point(name: "La Seine", description: 'La Seine est un fleuve français long de 776,6km qui arrose notamment Troyes, Paris, Rouen et Le Havre. \n' +
                    'Sa source se situe à 446m d\'altitude à Source-Seine, en Côte-d\'Or, sur le plateau de Langres. \n' +
                    'Elle se jette dans la Manche entre Le Havre et Honfleur.').save(flush: true, failOnError: true)
            g1point1.addToLocation(new Location(name:"Paris", latitude: 48.855619 ,longitude: 2.345862).save(flush: true, failOnError: true))
            def img1_point1 = new Image("groupe1poi1img1.jpg")
            def img2_point1 = new Image("groupe1poi1img2.jpg")
            g1point1.addToImages(img1_point1).save(flush: true, failOnError: true)
            g1point1.addToImages(img2_point1).save(flush: true, failOnError: true)
            groupe1.addToPoints(g1point1).save(flush: true, failOnError: true)
            def gp11 = new GroupePoi(groupe: groupe1, point:g1point1 ).save(flush: true, failOnError: true)

            // POI 2 : Cascade de Gairaut
            def g1point2 = new Point(name: "Cascade de Gairaut", description: 'Large chute d’eau artificielle construite au XIXe siècle dans le quartier de Gairaut (Nice). \n' +
                    'Elle s’écoule dans différents bassins de chute surmontés d’un chalet en bois travaillé. \n' +
                    'Le site est aménagé de grottes avec entre autres fausses stalactites.').save(flush: true, failOnError: true)
            g1point2.addToLocation(new Location(name:"Nice", latitude: 43.738639 ,longitude: 7.259747).save(flush: true, failOnError: true))
            def img1_g1point2 = new Image("groupe1poi2img1.jpg")
            def img2_g1point2 = new Image("groupe1poi2img2.jpg")
            g1point2.addToImages(img1_g1point2).save(flush: true, failOnError: true)
            g1point2.addToImages(img2_g1point2).save(flush: true, failOnError: true)
            groupe1.addToPoints(g1point2).save(flush: true, failOnError: true)
            def gp12 = new GroupePoi(groupe: groupe1, point:g1point2 ).save(flush: true, failOnError: true)

            // POI 3 : Lac d'Annecy
            def g1point3 = new Point(name: "Lac d'Annecy", description: 'Surnommé aussi lac bleu, ce lac de France est situé en Haute-Savoie. \n' +
                    'Il est le 2ème lac d\'origine glaciaire après celui du Bourget.\n' +
                    'Il s’est formé il y a environ 18 000 ans avec la fonte de glaciers alpins. \n' +
                    'Il est alimenté par 7 ruisseaux et torrents.').save(flush: true, failOnError: true)
            g1point3.addToLocation(new Location(name:"Annecy", latitude: 45.866670 ,longitude: 6.167287).save(flush: true, failOnError: true))
            def img1_g1point3 = new Image("groupe1poi3img1.jpg")
            def img2_g1point3 = new Image("groupe1poi3img2.jpg")
            def img3_g1point3 = new Image("groupe1poi3img3.jpg")
            g1point3.addToImages(img1_g1point3).save(flush: true, failOnError: true)
            g1point3.addToImages(img2_g1point3).save(flush: true, failOnError: true)
            g1point3.addToImages(img3_g1point3).save(flush: true, failOnError: true)
            groupe1.addToPoints(g1point3).save(flush: true, failOnError: true)
            def gp13 = new GroupePoi(groupe: groupe1, point:g1point3 ).save(flush: true, failOnError: true)

            // POI 4 : Bassin d'Arcachon
            def g1point4 = new Point(name: "Bassin d'Arcachon", description: 'Lagune située dans les Landes de Gascogne qui interrompt le cordon dunaire de 250km de la Côte d’Argent et s\'étend de l’estuaire de la Gironde au fleuve Adour.\n' +
                    'On y pratique beaucoup l’ostréiculture.\n' +
                    'Il abrite le parc naturel marin du bassin d\'Arcachon. ').save(flush: true, failOnError: true)
            g1point4.addToLocation(new Location(name:"Arcachon", latitude: 44.684724 ,longitude: -1.116658).save(flush: true, failOnError: true))
            def img1_g1point4 = new Image("groupe1poi4img1.jpg")
            def img2_g1point4 = new Image("groupe1poi4img2.jpg")
            def img3_g1point4 = new Image("groupe1poi4img3.jpg")
            g1point4.addToImages(img1_g1point4).save(flush: true, failOnError: true)
            g1point4.addToImages(img2_g1point4).save(flush: true, failOnError: true)
            g1point4.addToImages(img3_g1point4).save(flush: true, failOnError: true)
            groupe1.addToPoints(g1point4).save(flush: true, failOnError: true)
            def gp14 = new GroupePoi(groupe: groupe1, point:g1point4 ).save(flush: true, failOnError: true)

            // POI 5 : Centre thermale Vichy
            def g1point5 = new Point(name: "Centre thermale de Vichy", description: 'Commune française située dans le sud-est du département de l\'Allier \n' +
                    'Elle est connue dès l\'Antiquité pour ses sources. \n' +
                    'Elle devint une importante station thermale dans la seconde moitié du xixe siècle. ').save(flush: true, failOnError: true)
            g1point5.addToLocation(new Location(name:"Vichy", latitude: 46.131713 ,longitude: 3.424508).save(flush: true, failOnError: true))
            def img1_g1point5 = new Image("groupe1poi5img1.jpg")
            def img2_g1point5 = new Image("groupe1poi5img2.jpg")
            def img3_g1point5 = new Image("groupe1poi5img3.jpg")
            g1point5.addToImages(img1_g1point5).save(flush: true, failOnError: true)
            g1point5.addToImages(img2_g1point5).save(flush: true, failOnError: true)
            g1point5.addToImages(img3_g1point5).save(flush: true, failOnError: true)
            groupe1.addToPoints(g1point5).save(flush: true, failOnError: true)
            def gp15 = new GroupePoi(groupe: groupe1, point:g1point5 ).save(flush: true, failOnError: true)


        // GROUPE 2 : Lacs dans le monde
        def groupe2 = new Groupe(name: 'Lacs du monde', description: 'Les plus grands lacs présents sur notre planète').save(flush: true, failOnError: true)
        def groupe2_img = new Image("groupe2.jpg")
        groupe2.addToImages(groupe2_img).save(flush: true, failOnError: true)

            // POI 1 : Lac Titicaca
            def g2point1 = new Point(name: "Lac Titicaca", description: 'Situé dans la cordillère des Andes, il est traversé par la frontière entre la Bolivie et le Pérou. \n' +
                    'Considéré comme le plus haut lac navigable du monde, c\'est le plus grand lac d\'Amérique du Sud en volume d\'eau et en longueur mais pas en superficie.').save(flush: true, failOnError: true)
            g2point1.addToLocation(new Location(name:"Puno", latitude: -15.837523 ,longitude: -70.017106).save(flush: true, failOnError: true))
            g2point1.addToLocation(new Location(name:"Copacabana", latitude: -16.171450 ,longitude: -69.093800).save(flush: true, failOnError: true))
            def img1_g2point1 = new Image("groupe2poi1img1.jpg")
            def img2_g2point1 = new Image("groupe2poi1img2.jpg")
            g2point1.addToImages(img1_g2point1).save(flush: true, failOnError: true)
            g2point1.addToImages(img2_g2point1).save(flush: true, failOnError: true)
            groupe2.addToPoints(g2point1).save(flush: true, failOnError: true)
            def gp21 = new GroupePoi(groupe: groupe2, point:g2point1 ).save(flush: true, failOnError: true)

            // POI 2 : Lac Malawi
            def g2point2 = new Point(name: "Lac Malawi", description: 'Un des Grands Lacs d\'Afrique de l\'Est, anciennement appelé lac Nyasa, ses rives se partagent entre 3 États : le Malawi, le Mozambique et la Tanzanie.\n' +
                    '3ème lac africain par sa taille, il occupe le 5ème rang au classement des grands lacs mondiaux en volume.').save(flush: true, failOnError: true)
            g2point2.addToLocation(new Location(name:"Nhotakota", latitude: -12.925113,longitude: 34.298995).save(flush: true, failOnError: true))
            g2point2.addToLocation(new Location(name:"Metangula", latitude: -12.692371,longitude: 34.804834).save(flush: true, failOnError: true))
            g2point2.addToLocation(new Location(name:"Manda", latitude: -10.454304,longitude: 34.585411).save(flush: true, failOnError: true))
            def img1_g2point2 = new Image("groupe2poi2img1.jpg")
            def img2_g2point2 = new Image("groupe2poi2img2.jpg")
            def img3_g2point2 = new Image("groupe2poi2img3.jpg")
            g2point2.addToImages(img1_g2point2).save(flush: true, failOnError: true)
            g2point2.addToImages(img2_g2point2).save(flush: true, failOnError: true)
            g2point2.addToImages(img3_g2point2).save(flush: true, failOnError: true)
            groupe2.addToPoints(g2point2).save(flush: true, failOnError: true)
            def gp22 = new GroupePoi(groupe: groupe2, point:g2point2 ).save(flush: true, failOnError: true)

            // POI 3 : Lac d'Annecy
            groupe2.addToPoints(g1point3).save(flush: true, failOnError: true)
            def gp23 = new GroupePoi(groupe: groupe2, point:g1point3).save(flush: true, failOnError: true)

            // POI 4 : Lac Michigan
            def g2point4 = new Point(name: "Lac Michigan", description: 'L\'un des cinq Grands Lacs d\'Amérique du Nord, c\'est le seul entièrement situé aux États-Unis (les autres étant partagés avec le Canada). Le terme Michigan a été utilisé pour désigner le lac lui-même.\n' +
                    'Il signifie grandes eaux.').save(flush: true, failOnError: true)
            g2point4.addToLocation(new Location(name:"Chicago", latitude: 41.868290 ,longitude: -87.613803).save(flush: true, failOnError: true))
            def img1_g2point4 = new Image("groupe2poi4img1.jpg")
            def img2_g2point4 = new Image("groupe2poi4img2.jpg")
            g2point4.addToImages(img1_g2point4).save(flush: true, failOnError: true)
            g2point4.addToImages(img2_g2point4).save(flush: true, failOnError: true)
            groupe2.addToPoints(g2point4).save(flush: true, failOnError: true)
            def gp24 = new GroupePoi(groupe: groupe2, point:g2point4 ).save(flush: true, failOnError: true)

            // POI 5 : Lac Kanas
            def g2point5 = new Point(name: "Lac Kanas", description: 'Lac situé dans la bordure de la chaîne de l\'Altaï (taïga sibérienne) dans la région du Xinjiang (Chine). \n' +
                    'Son nom signifie contrée fertile et mystérieuse. \n' +
                    'Il est aussi appelé palette de Dieu en raison de la variété et de la beauté de ses couleurs.').save(flush: true, failOnError: true)
            g2point5.addToLocation(new Location(name:"Xian de Burqin", latitude: 48.828716 ,longitude: 87.046175).save(flush: true, failOnError: true))
            def img1_g2point5 = new Image("groupe2poi5img1.jpg")
            g2point5.addToImages(img1_g2point5).save(flush: true, failOnError: true)
            groupe2.addToPoints(g2point5).save(flush: true, failOnError: true)
            def gp25 = new GroupePoi(groupe: groupe2, point:g2point5 ).save(flush: true, failOnError: true)


        // GROUPE 3 : S'hydrater
        def groupe3 = new Groupe(name: 'S\'hydrater ', description: 'Qu\'on se le dise, qu\'on se le répète haut et fort : il faut boire !').save(flush: true, failOnError: true)
        def groupe3_img = new Image("groupe3.jpg")
        groupe3.addToImages(groupe3_img).save(flush: true, failOnError: true)

            // POI 1 : Ain Fouara
            def g3point1 = new Point(name: "Aïn Fouara", description: 'A l’origine, ce fut une simple fontaine autour du jaillissement d’une source chaude en hiver et froide en été bâtie lors de l’occupation de Sétif.\n' +
                    'C\'est le Directeur des Beaux-Arts qui sollicita le don d’une statue pour décorer la fontaine.').save(flush: true, failOnError: true)
            g3point1.addToLocation(new Location(name:"Sétif", latitude: 36.189392 ,longitude: 5.405003).save(flush: true, failOnError: true))
            def img1_g3point1 = new Image("groupe3poi1img1.jpg")
            g3point1.addToImages(img1_g3point1).save(flush: true, failOnError: true)
            groupe3.addToPoints(g3point1).save(flush: true, failOnError: true)
            def gp31 = new GroupePoi(groupe: groupe3, point:g3point1 ).save(flush: true, failOnError: true)

            // POI 2 : Centre commercial E.Leclerc
            def g3point2 = new Point(name: "Centre commercial E.Leclerc", description: 'Offre une large gamme d’eau de source.').save(flush: true, failOnError: true)
            g3point2.addToLocation(new Location(name:"Paris", latitude: 48.898990 ,longitude: 2.373984).save(flush: true, failOnError: true))
            g3point2.addToLocation(new Location(name:"Nice", latitude:43.709525 ,longitude: 7.189242).save(flush: true, failOnError: true))
            g3point2.addToLocation(new Location(name:"Marseille", latitude: 43.233907 ,longitude: 5.401567).save(flush: true, failOnError: true))
            g3point2.addToLocation(new Location(name:"Lyon", latitude: 45.761864 ,longitude: 4.804100).save(flush: true, failOnError: true))
            g3point2.addToLocation(new Location(name:"Bordeaux", latitude: 44.863451,longitude: -0.568029).save(flush: true, failOnError: true))
            def img1_g3point2 = new Image("groupe3poi2img1.jpg")
            g3point2.addToImages(img1_g3point2).save(flush: true, failOnError: true)
            groupe3.addToPoints(g3point2).save(flush: true, failOnError: true)
            def gp32 = new GroupePoi(groupe: groupe3, point:g3point2 ).save(flush: true, failOnError: true)

            // POI 3 : Source d'eau Rey
            def g3point3 = new Point(name: "Source d'eau Rey", description: 'Source d\'eau située à Morgex sur la ville d\'Aoste en Italie.').save(flush: true, failOnError: true)
            g3point3.addToLocation(new Location(name:"Aoste", latitude: 45.755566,longitude: 7.035695).save(flush: true, failOnError: true))
            def img1_g3point3 = new Image("groupe3poi3img1.jpg")
            def img2_g3point3 = new Image("groupe3poi3img2.jpg")
            g3point3.addToImages(img1_g3point3).save(flush: true, failOnError: true)
            g3point3.addToImages(img2_g3point3).save(flush: true, failOnError: true)
            groupe3.addToPoints(g3point3).save(flush: true, failOnError: true)
            def gp33 = new GroupePoi(groupe: groupe3, point:g3point3 ).save(flush: true, failOnError: true)

            // POI 4 : Source naturelle Kotje
            def g3point4 = new Point(name: "Source naturelle Kotje", description: 'Source naturelle d\'eau potable situé en Slovénie.').save(flush: true, failOnError: true)
            g3point4.addToLocation(new Location(name:"Ravne na Koroškem", latitude: 46.514153 ,longitude: 14.984479).save(flush: true, failOnError: true))
            def img1_g3point4 = new Image("groupe3poi4img1.jpg")
            g3point4.addToImages(img1_g3point4).save(flush: true, failOnError: true)
            groupe3.addToPoints(g3point4).save(flush: true, failOnError: true)
            def gp34 = new GroupePoi(groupe: groupe3, point:g3point4 ).save(flush: true, failOnError: true)

            // POI 5 : Municipal Jubilee of the Clebe fountain
            def g3point5 = new Point(name: "The Clebe fountain", description: 'Located in Australia, this fountain was erected to celebrate the Municipal Jubilee of the Clebe in 2nd august 1909.').save(flush: true, failOnError: true)
            g3point5.addToLocation(new Location(name:"Glebe", latitude: -33.884423 ,longitude: 151.192755).save(flush: true, failOnError: true))
            def img1_g3point5 = new Image("groupe3poi5img1.jpg")
            g3point5.addToImages(img1_g3point5).save(flush: true, failOnError: true)
            groupe3.addToPoints(g3point5).save(flush: true, failOnError: true)
            def gp35 = new GroupePoi(groupe: groupe3, point:g3point5 ).save(flush: true, failOnError: true)

    }

    def destroy = {
    }
}
