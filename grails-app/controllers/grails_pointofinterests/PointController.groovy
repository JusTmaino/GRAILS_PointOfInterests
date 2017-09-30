package grails_pointofinterests

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile
import org.springframework.web.multipart.support.StandardMultipartHttpServletRequest


@Transactional(readOnly = true)
class PointController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Point> PointsList = Point.findAll()
        [customPointsList:PointsList]
        //respond Point.list(params), model:[pointCount: Point.count()]
    }

    def show(Point point) {
        //Point
        respond point
    }

    def create() {
        respond new Point(params)
    }

    @Transactional
    def save(Point point) {
        if (point == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (point.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond point.errors, view:'create'
            return
        }
        def image = new Image(path: params.image)
        Point.addToImages(image)

        params.fileupload.transferTo(new java.io.File("/Applications/MAMP/htdocs/images/"+params.image))

        point.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'point.label', default: 'Point'), point.id])
                redirect point
            }
            '*' { respond point, [status: CREATED] }
        }

    }


    def edit(Point point) {
        respond point
    }

    @Transactional
    def update(Point point) {
        if (point == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (point.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond point.errors, view:'edit'
            return
        }

        point.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'point.label', default: 'Point'), point.id])
                redirect point
            }
            '*'{ respond point, [status: OK] }
        }
    }

    @Transactional
    def delete(Point point) {

        if (point == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        point.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'point.label', default: 'Point'), point.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'point.label', default: 'Point'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
