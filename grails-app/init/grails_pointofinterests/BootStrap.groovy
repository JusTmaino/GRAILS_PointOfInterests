package grails_pointofinterests

class BootStrap {

    def init = { servletContext ->

        // Role
        def administrateurRole = Role.findByAuthority('ROLE_ADMIN') ?: new Role('ROLE_ADMIN').save(flush: true, failOnError: true);
        def moderateurRole = Role.findByAuthority('ROLE_MOD') ?: new Role('ROLE_MOD').save(flush: true, failOnError: true);
        def utilisateurRole = Role.findByAuthority('ROLE_USER') ?: new Role('ROLE_USER').save(flush: true, failOnError: true);

        // User
        def administrateurUser = new User('admin', 'admin').save();
        def moderateurUser = new User('moderateur', 'moderateur').save();
        def utilisateurUser = new User('utilisateur', 'utilisateur').save();

        // UserRole
        UserRole.create(administrateurUser, administrateurRole, true);
        UserRole.create(moderateurUser, moderateurRole, true);
        UserRole.create(utilisateurUser, utilisateurRole, true);

        (1..3).each {
            int i ->
                def groupe = new Groupe(name: 'groupe ' + i, description: 'description ' + i).save(flush: true, failOnError: true)

                (1..5).each {
                    int j ->
                        def point = new Point(name: "POI " +i+""+j, description: 'description ' +i+""+j).save(flush: true, failOnError: true)
                        point.addToLocation(new Location(name:"test",latitude:17,longitude:47,altitude:12));
                        def groupepoi = new GroupePoi(groupe: groupe, point:point ).save(flush: true, failOnError: true)
                }
        }
    }

    def destroy = {
    }
}
