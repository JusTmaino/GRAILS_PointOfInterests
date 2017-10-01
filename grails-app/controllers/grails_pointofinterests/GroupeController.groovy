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
        def groupepoi = new GroupePoi(groupe: groupe, point:point ).save(flush: true, failOnError: true)

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
        List<Point> pointList = Point.findAll()
        List<Image> imageList = Image.findAll()
        [customGroupe:groupe,customPointList:pointList,customimageList:imageList]
        //respond groupe
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

        groupe.save flush:true

        Point point = Point.findById(params.pointID);
        groupe.addToPoints(point).save(flush: true, failOnError: true)
        Image img = Image.findById(params.imageID);
        groupe.addToImages(img).save(flush: true, failOnError: true)
        def groupepoi = new GroupePoi(groupe: groupe, point:point ).save(flush: true, failOnError: true)

        Image image = new Image(path: params.image)
        //groupe.addToImages(image)
        //params.fileupload.transferTo(new java.io.File("/Applications/MAMP/htdocs/images/"+params.image))

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

        int pointSize = groupe.points.size();
        (0..pointSize-1).each {
            int i ->
                //System.out.println("point.location["+i+"] : "+point.location[i])
                groupe.removeFromPoints(groupe.points[i])//.save(flush: true, failOnError: true);
        }
        int imageSize = groupe.images.size();
        (0..imageSize-1).each {
            int l ->
                //System.out.println("point.location["+i+"] : "+point.location[i])
                groupe.removeFromImages(groupe.images[l])//.save(flush: true, failOnError: true);
        }

        List<GroupePoi> allGroupePoi = GroupePoi.findAll() ;
        int allGroupePoiSize = allGroupePoi.size();
        (0..allGroupePoiSize-1).each {
            int j ->
                if (allGroupePoi[j].groupe == groupe) {
                    //System.out.println("allGroupe["+j+"].points["+k+"].id : "+allGroupe[j].points[k].id)
                    allGroupePoi[j].delete()
                }
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
