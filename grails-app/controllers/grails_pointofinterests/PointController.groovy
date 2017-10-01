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

        point.save flush:true

        Location location = Location.findById(params.LocationID);
        point.addToLocation(location).save(flush: true, failOnError: true)
        Groupe groupe = Groupe.findById(params.groupeID);
        groupe.addToPoints(point).save(flush: true, failOnError: true)

        Image image = new Image(path: params.image)
        point.addToImages(image)
        //params.fileupload.transferTo(new java.io.File("/Applications/MAMP/htdocs/images/"+params.image))

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

        int locationSize = point.location.size();
        (0..locationSize-1).each {
            int i ->
                //System.out.println("point.location["+i+"] : "+point.location[i])
                point.removeFromLocation(point.location[i])//.save(flush: true, failOnError: true);
        }

        List<Groupe> allGroupe = Groupe.findAll() ;
        int allGroupeSize = allGroupe.size();
        (0..allGroupeSize-1).each {
            int j ->
                (0..allGroupe[j].points.size()-1).each {
                    int k ->
                        if (allGroupe[j].points[k] == point) {
                            //System.out.println("allGroupe["+j+"].points["+k+"].id : "+allGroupe[j].points[k].id)
                            allGroupe[j].removeFromPoints(point)
                        }
                }
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
