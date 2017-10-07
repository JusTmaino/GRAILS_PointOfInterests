package grails_pointofinterests

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ImageController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    // ImagesSer imageServ
    boolean createViaPoint = false
    String pointID

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        List<Image> image = Image.findAll()
        [customImageList:image]
        //respond Image.list(params), model:[imageCount: Image.count()]
    }

    def show(Image image) {
        respond image
    }

    def create() {
        //System.out.println(params.point);
        if(params.point!= null)
        {
            createViaPoint = true
            pointID = params.point.id
        }
        respond new Image(params)
    }

    @Transactional
    def save(Image image) {
        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'create'
            return
        }

        def f = request.getFile('fileupload')
        image.getFilename()
        if(f != null) {
            if (f.empty) {
                flash.message = 'file cannot be empty'
            }
            f.transferTo(new File(grailsApplication.config.server.uploadImage + image.filename))
        }

        image.save flush:true

        //System.out.println(createViaPoint);
        if(createViaPoint)
        {
            if(pointID!="") {
                Point point = Point.findById(Integer.parseInt(pointID))
                point.addToImages(image).save(flush: true, failOnError: true)
                //System.out.println("image Created");
                System.out.println("redirection to EDIT point")
                redirect(controller: 'point', action:'edit' , id: point.id)
            }
            else
            {
                System.out.println("redirection to CREATE point")
                redirect(controller: 'point', action:'create')
            }
        }
        else {

            request.withFormat {
                form multipartForm {
                    flash.message = message(code: 'default.created.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                    redirect image
                }
                '*' { respond image, [status: CREATED] }
            }
        }
    }


    def edit(Image image) {
        respond image
    }

    @Transactional
    def update(Image image) {
        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (image.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond image.errors, view:'edit'
            return
        }

        image.save flush:true, failOnError:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect image
            }
            '*'{ respond image, [status: OK] }
        }
    }

    @Transactional
    def delete(Image image) {

        if (image == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        List<Groupe> groupe = Groupe.findAll() ;
        int groupeSize = groupe.size();
        (0..groupeSize-1).each {
            int j ->
                (0..groupe[j].images.size()-1).each {
                    int k ->
                        if (groupe[j].images[k] == image) {
                            groupe[j].removeFromImages(image)
                        }
                }
        }

        List<Point> point = Point.findAll() ;
        int pointSize = point.size();
        (0..pointSize-1).each {
            int j ->
                (0..point[j].images.size()-1).each {
                    int k ->
                        if (point[j].images[k] == image) {
                            point[j].removeFromImages(image)
                        }
                }
        }

        image.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'image.label', default: 'Image'), image.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'image.label', default: 'Image'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
