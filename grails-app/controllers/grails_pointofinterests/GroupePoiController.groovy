package grails_pointofinterests

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupePoiController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond GroupePoi.list(params), model:[groupePoiCount: GroupePoi.count()]
    }

    def show(GroupePoi groupePoi) {
        respond groupePoi
    }

    def create() {
        respond new GroupePoi(params)
    }

    @Transactional
    def save(GroupePoi groupePoi) {
        if (groupePoi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupePoi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupePoi.errors, view:'create'
            return
        }

        groupePoi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupePoi.label', default: 'GroupePoi'), groupePoi.id])
                redirect groupePoi
            }
            '*' { respond groupePoi, [status: CREATED] }
        }
    }

    def edit(GroupePoi groupePoi) {
        respond groupePoi
    }

    @Transactional
    def update(GroupePoi groupePoi) {
        if (groupePoi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupePoi.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupePoi.errors, view:'edit'
            return
        }

        groupePoi.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'groupePoi.label', default: 'GroupePoi'), groupePoi.id])
                redirect groupePoi
            }
            '*'{ respond groupePoi, [status: OK] }
        }
    }

    @Transactional
    def delete(GroupePoi groupePoi) {

        if (groupePoi == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        groupePoi.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupePoi.label', default: 'GroupePoi'), groupePoi.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupePoi.label', default: 'GroupePoi'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
