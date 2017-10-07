package grails_pointofinterests

class Point {
    String name;
    String description;
    static beLongsTo = [Groupe];

    static hasMany = [images:Image,location:Location]

    //static hasOne = [location:Location]

    static constraints = {

    }
}
