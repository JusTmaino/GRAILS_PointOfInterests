package grails_pointofinterests

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LocationController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    boolean createViaPoint = false
    String pointID

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Location> LocationsList = Location.findAll()
        [customLocationsList:LocationsList]
        //respond Location.list(params), model:[locationCount: Location.count()]
    }

    def show(Location location) {
        respond location
    }

    def create() {
        System.out.println(params.point);
        if(params.point!= null)
        {
            createViaPoint = true
            pointID = params.point.id
        }
        respond new Location(params)
    }

    @Transactional
    def save(Location location) {
        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (location.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond location.errors, view:'create'
            return
        }

        location.save flush:true

        System.out.println(createViaPoint);
        if(createViaPoint)
        {
            if(pointID!="") {
                Point point = Point.findById(Integer.parseInt(pointID))
                point.addToLocation(location).save(flush: true, failOnError: true)
                System.out.println("location Created");
                System.out.println("redirection to EDIT point")
                request.withFormat {
                    form multipartForm {
                        flash.message = message(code: 'default.updated.message', args: [message(code: 'point.label', default: 'Point'), point.id])
                        redirect point
                    }
                    '*'{ respond point, [status: OK] }
                }
            }
            else
            {
                System.out.println("redirection to CREATE point")
                redirect(controller: 'point', action:'index')
            }
        }
        else {

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                    redirect location
                }
                '*' { respond location, [status: CREATED] }
            }
        }
    }

    def edit(Location location) {
        respond location
    }

    @Transactional
    def update(Location location) {
        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (location.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond location.errors, view:'edit'
            return
        }

        location.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect location
            }
            '*'{ respond location, [status: OK] }
        }
    }

    @Transactional
    def delete(Location location) {

        if (location == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        List<Point> allPoint = Point.findAll() ;
        int allPointSize = allPoint.size();
        (0..allPointSize-1).each {
            int j ->
                (0..allPoint[j].location.size()-1).each {
                    int k ->
                        if (allPoint[j].location[k] == location) {
                            allPoint[j].removeFromLocation(location)
                        }
                }
        }

        location.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'location.label', default: 'Location'), location.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'location.label', default: 'Location'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
