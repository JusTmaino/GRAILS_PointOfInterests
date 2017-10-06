package grails_pointofinterests

import grails.util.Environment;
import org.apache.commons.io.FileUtils;


class BootStrap {
    def grailsApplication
    def init = { servletContext ->

        // Role
        def administrateurRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role('ROLE_ADMIN').save(flush: true, failOnError: true);
        def moderateurRole = Role.findByAuthority('ROLE_MOD') ?: new Role('ROLE_MOD').save(flush: true, failOnError: true);
        def utilisateurRole = Role.findByAuthority('ROLE_USER') ?: new Role('ROLE_USER').save(flush: true, failOnError: true);

        // User
        def administrateurUser = new User('admin', 'admin').save(flush: true, failOnError: true);
        def moderateurUser = new User('moderateur', 'moderateur').save(flush: true, failOnError: true);
        def utilisateurUser = new User('utilisateur', 'utilisateur').save(flush: true, failOnError: true);

        // UserRole
        UserRole.create(administrateurUser, administrateurRole, true);
        UserRole.create(moderateurUser, moderateurRole, true);
        UserRole.create(utilisateurUser, utilisateurRole, true);

        def img = new Image("stade-de-france.jpg")
        def img2 = new Image("visiter-de-stade.jpg")

        String sourceDir = System.getProperty("user.dir")+"\\grails-app\\assets\\images"

        def destinationDir = grailsApplication.config.server.uploadImage
        def f = new File(sourceDir)
        def f2 = new File(destinationDir)
        FileUtils.copyDirectory(f,f2)

        (1..3).each {
            int i ->
                def groupe = new Groupe(name: 'groupe ' + i, description: 'description ' + i).save(flush: true, failOnError: true)
                    
                (1..5).each {
                    int j ->

                        def point = new Point(name: "POI " +i+""+j, description: 'description ' +i+""+j).save(flush: true, failOnError: true)
                        point.addToLocation(new Location(name:"test",latitude: (Math.random()*10*(j+i)) ,longitude: (Math.random()*(j+i))).save(flush: true, failOnError: true))

                        point.addToImages(img).save(flush: true, failOnError: true);
                        point.addToImages(img2).save(flush: true, failOnError: true);
                        groupe.addToPoints(point).save(flush: true, failOnError: true)
                       def groupepoi = new GroupePoi(groupe: groupe, point:point ).save(flush: true, failOnError: true)
                }
        }
    }

    def destroy = {
    }
}
