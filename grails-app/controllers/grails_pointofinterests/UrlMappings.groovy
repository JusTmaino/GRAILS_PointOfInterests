package grails_pointofinterests

class UrlMappings {

    def springSecurityService

    def getLoggedUser() {
        def principal = springSecurityService.principal
        String username = principal.username
    }

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
