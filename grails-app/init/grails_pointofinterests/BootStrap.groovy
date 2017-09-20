package grails_pointofinterests

class BootStrap {

    def init = { servletContext ->

        // Role
        def administrateurRole = new Role('ROLE_ADMIN').save();
        def moderateurRole = new Role('ROLE_MOD').save();
        def utilisateurRole = new Role('ROLE_USER').save();

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
                        def point = new Point(name: "POI " + j, description: 'description ' + j).save(flush: true, failOnError: true)
                        def groupepoi = new GroupePoi(groupe: groupe, point:point ).save(flush: true, failOnError: true)
                }
        }
    }

    def destroy = {
    }
}
