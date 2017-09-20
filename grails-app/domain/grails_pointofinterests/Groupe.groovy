package grails_pointofinterests

class Groupe {

    String name;
    String description;

    static hasMany = [images:Image]

    static constraints = {
        name blank:false
        description blank: false
    }

    /*static mapping = {
        table 'groupe'
        version false
        id_column:'id_group'
        name column : name
        description column : description
    }*/
}
