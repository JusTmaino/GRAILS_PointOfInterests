package grails_pointofinterests

//import static org.springframework.*
import grails.transaction.Transactional



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
        [point:point,pointLocations:point.getLocation()]
        //respond point
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

        (0..params.LocationID.size()-1).each {
            int j ->
                Location location = Location.findById(params.LocationID[j]);
                point.addToLocation(location).save(flush: true, failOnError: true)
        }

        if (params.imageID != null) {
            (0..params.imageID.size() - 1).each {
                int j ->
                    Image img = Image.findById(params.imageID[j]);
                    point.addToImages(img).save(flush: true, failOnError: true)
            }
        }

        Groupe groupe = Groupe.findById(params.groupeID);
        groupe.addToPoints(point).save(flush: true, failOnError: true)

        Image image = new Image(path: params.image)
        point.addToImages(image)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'point.label', default: 'Point'), point.id])
                redirect point
            }
            '*' { respond point, [status: CREATED] }
        }

    }


    def edit(Point point) {
        def locationList = Location.findAll()
        def imageList = Image.findAll()
        (0..point.location.size()-1).each {
            int i ->
                locationList.remove(point.location[i])
        }
        (0..point.images.size()-1).each {
            int i ->
                imageList.remove(point.images[i])
        }
        [customPoint:point,customLocationList:locationList,customImageList:imageList]
        //respond point
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

        if (params.locationID != null) {
            (0..params.locationID.size() - 1).each {
                int j ->
                    Location location = Location.findById(params.locationID[j]);
                    point.addToLocation(location).save(flush: true, failOnError: true)
            }
        }

        if (params.imageID != null) {
            (0..params.imageID.size() - 1).each {
                int j ->
                    Image img = Image.findById(params.imageID[j]);
                    point.addToImages(img).save(flush: true, failOnError: true)
            }
        }

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
        (locationSize-1..0).each {
            int i ->
                point.removeFromLocation(point.location[i])
        }

        int imageSize = point.images.size();
        (imageSize-1..0).each {
            int l ->
                point.removeFromImages(point.images[l])
        }

        List<Groupe> allGroupe = Groupe.findAll() ;
        int allGroupeSize = allGroupe.size();
        (0..allGroupeSize-1).each {
            int j ->
                (0..allGroupe[j].points.size()-1).each {
                    int k ->
                        if (allGroupe[j].points[k] == point) {
                            allGroupe[j].removeFromPoints(point)
                        }
                }
        }

        List<GroupePoi> allGroupePoi = GroupePoi.findAll() ;
        int allGroupePoiSize = allGroupePoi.size();
        (0..allGroupePoiSize-1).each {
            int j ->
                if (allGroupePoi[j].point == point) {
                    allGroupePoi[j].delete()
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

    def removeLocation()
    {
        Point point = Point.findById(params.pointID)
        point.removeFromLocation(Location.findById(params.locationID))
        point.save flush:true
        redirect(controller: 'point', action:'edit' , id: params.pointID)
    }

    def removeImage()
    {
        Point point = Point.findById(params.pointID)
        point.removeFromImages(Image.findById(params.imageID))
        point.save flush:true
        redirect(controller: 'point', action:'edit' , id: params.pointID)
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
