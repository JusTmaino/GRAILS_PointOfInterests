

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'grails_pointofinterests.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'grails_pointofinterests.UserRole'
grails.plugin.springsecurity.authority.className = 'grails_pointofinterests.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.logout.afterLogoutUrl = '/'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
//grails.plugin.springsecurity.auth.loginFormUrl = '/login'
//grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/login'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/dbconsole/**',   access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/user/**',        access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/user/register',  access: ['permitAll']],
    [pattern: '/role/**',        access: ['ROLE_ADMIN']],
    [pattern: '/userRole/**',    access: ['ROLE_ADMIN']],
	[pattern: '/groupe/**',      access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/groupe/index',   access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/groupe/show',    access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/groupepoi/**',   access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/image/**',       access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/image/index',    access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/image/show',     access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/location/**',    access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/location/index', access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/location/show',  access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/point/**',       access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/point/index',    access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/point/show',     access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
    [pattern: '/user/profile',   access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/**/js/**',       access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
	[pattern: '/**/css/**',      access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/**/images/**',   access: ['ROLE_ADMIN','ROLE_MOD', 'ROLE_USER']],
	[pattern: '/**/favicon.ico', access: ['permitAll']]
]

grails.plugin.springsecurity.filterChain.chainMap = [
	[pattern: '/assets/**',      filters: 'none'],
	[pattern: '/**/js/**',       filters: 'none'],
	[pattern: '/**/css/**',      filters: 'none'],
	[pattern: '/**/images/**',   filters: 'none'],
	[pattern: '/**/favicon.ico', filters: 'none'],
	[pattern: '/**',             filters: 'JOINED_FILTERS']
]

// 10 Mo max upload
grails.controllers.upload.maxFileSize=10000000
grails.controllers.upload.maxRequestSize=10000000