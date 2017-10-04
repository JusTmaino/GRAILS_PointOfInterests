package grails_pointofinterests

class Image {

    String filename;
    java.util.Date dateCreated;
    java.util.Date lastUpdated;

    static constraints = {
        filename blank:false
    }

    static mapping = {
    }

    Image(String filename) {
        this.filename = filename
    }

}
