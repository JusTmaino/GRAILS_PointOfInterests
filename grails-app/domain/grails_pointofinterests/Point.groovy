package grails_pointofinterests

class Point {
    String name;
    String description;
    static beLongsTo = [Groupe];

    static hasMany = [images:Image,location:Location,groupes:Groupe]

    //static hasOne = [location:Location]

    static constraints = {

    }
}
