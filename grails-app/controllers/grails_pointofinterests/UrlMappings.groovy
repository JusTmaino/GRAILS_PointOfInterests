package grails_pointofinterests

class UrlMappings {

    def springSecurityService

    def getLoggedUser() {
        def principal = springSecurityService.principal
        String username = principal.username
        String user = springSecurityService.getCurrentUser();
        [user:user]
    }

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "403"(view:'/error')
    }
}
