package grails_pointofinterests

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/login/$action?"(controller: "login")
        "/logout/$action?"(controller: "logout")

        "/groupe"{
            controller = "groupe"
            method = 'GET'
            action = "index"
        }

        "/location"{
            controller = "location"
            method = 'GET'
            action = "create"
        }

        "/image"{
            controller = "image"
            method = 'GET'
            action = "create"
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
        "405"(view:'/error')

    }
}
