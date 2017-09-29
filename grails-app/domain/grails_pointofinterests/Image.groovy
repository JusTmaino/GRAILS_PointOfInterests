package grails_pointofinterests

class Image {

    String filename;
    java.util.Date date_created;

    static constraints = {
        filename blank:false
       date_created nullable:false
    }

    /*static mapping = {
        table 'image'
        version false
        id_column:'id_image'
        filename column : filename
        date_created column : date_created
    }*/

    Image(String filename, Date date_created) {
        this.filename = filename
        this.date_created = date_created
    }
}
