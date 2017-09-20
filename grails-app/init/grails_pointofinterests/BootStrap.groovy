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
    }
    def destroy = {
    }
}
