package grails_pointofinterests

class Location {

    String name;
    Double latitude;
    Double longitude;
    Double altitude;

    static beLongsTo = [point:Point];

    static constraints = {
        name blank:false
        latitude nullable:false
        longitude nullable:false
        altitude nullable:false
    }

    /*static mapping = {
        table 'location'
        version false
        id_column:'id_location'
        latitude column : latitude
        longitude column : longitude
        altitude column : altitude
    }*/
}
