package grails_pointofinterests

import grails.plugin.springsecurity.SpringSecurityService

class LoginController extends grails.plugin.springsecurity.LoginController {

    def SpringSecurityService
    def index() {
        if (springSecurityService.isLoggedIn()) {
            redirect uri: conf.successHandler.defaultTargetUrl
        }
        else {
            redirect action: 'auth', params: params
        }
    }

    def auth(){

    }

}
