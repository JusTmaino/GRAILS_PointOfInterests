package grails_pointofinterests

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class GroupeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Groupe.list(params), model:[groupeCount: Groupe.count()]
    }

    def show(Groupe groupe) {
        respond groupe
    }

    def create() {
        List<Point> pointList = Point.findAll()
        List<Image> imageList = Image.findAll()
        [customPointList:pointList,customimageList:imageList]
        //respond new Groupe(params)
    }

    @Transactional
    def save(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'create'
            return
        }

        groupe.save flush:true

        Point point = Point.findById(params.pointID);
        groupe.addToPoints(point).save(flush: true, failOnError: true)
        Image img = Image.findById(params.imageID);
        groupe.addToImages(img).save(flush: true, failOnError: true)

        Image image = new Image(path: params.image)
        groupe.addToImages(image)
        //params.fileupload.transferTo(new java.io.File("/Applications/MAMP/htdocs/images/"+params.image))

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*' { respond groupe, [status: CREATED] }
        }
    }

    def edit(Groupe groupe) {
        respond groupe
    }

    @Transactional
    def update(Groupe groupe) {
        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (groupe.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond groupe.errors, view:'edit'
            return
        }
        def image = new Image(path: params.image)
        groupe.addToImages(image)

        params.fileupload.transferTo(new java.io.File("/Applications/MAMP/htdocs/images/"+params.image))

        groupe.save flush:true

        groupe.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect groupe
            }
            '*'{ respond groupe, [status: OK] }
        }
    }

    @Transactional
    def delete(Groupe groupe) {

        if (groupe == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        groupe.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'groupe.label', default: 'Groupe'), groupe.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'groupe.label', default: 'Groupe'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
