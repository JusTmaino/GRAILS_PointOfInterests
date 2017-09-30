package grails_pointofinterests

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def springSecurityService

    @Secured(['ROLE_ADMIN','ROLE_MOD'])
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)

        List<User> usersList = User.findAll()
        [customUserList:usersList]
        //respond User.list(params), model:[userCount: User.count()]
    }

    @Secured(['ROLE_ADMIN','ROLE_MOD'])
    def show(User user) {
        respond user
    }

    @Secured(['ROLE_ADMIN','ROLE_MOD'])
    def create() {
        //System.out.println(params.role);
        List<Role> roleList = Role.findAll()
        [customRoleList:roleList]
        //respond new User(params)
    }

    @Transactional
    def save(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'create'
            return
        }

        user.save flush:true
        //System.out.println(params.roleID)
        //System.out.println(Role.findById(params.roleID))
        //System.out.println(user)
        Role role=Role.findById(params.roleID);
        UserRole.create (user, role, true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }

    }

    @Secured(['ROLE_ADMIN','ROLE_MOD'])
    def edit(User user) {
        List<Role> roleList = Role.findAll()
        [customUser:user,customRoleList:roleList]
        //respond user
    }

    @Secured(['ROLE_ADMIN','ROLE_MOD','ROLE_USER'])
    @Transactional
    def update(User user) {
        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (user.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond user.errors, view:'edit'
            return
        }

        user.save flush:true


        Role removedRole=Role.findById(UserRole.findByUser(user).role.id);
        UserRole.remove (user, removedRole)
        Role newRole=Role.findById(params.roleID);
        UserRole.create (user, newRole, true)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*'{ respond user, [status: OK] }
        }
    }

    @Transactional
    def delete(User user) {

        if (user == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        Role removedRole=Role.findById(UserRole.findByUser(user).role.id);
        UserRole.remove (user, removedRole)
        user.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured(['ROLE_ADMIN','ROLE_MOD','ROLE_USER'])
    def profile(){
        User user = springSecurityService.getCurrentUser()
        [customUser:user]
        //respond user
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
