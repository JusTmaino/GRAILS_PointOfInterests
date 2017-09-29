

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'grails_pointofinterests.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'grails_pointofinterests.UserRole'
grails.plugin.springsecurity.authority.className = 'grails_pointofinterests.Role'
grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.logout.afterLogoutUrl = '/login'
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/'
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
//grails.plugin.springsecurity.auth.loginFormUrl = '/login'
//grails.plugin.springsecurity.failureHandler.defaultFailureUrl = '/login'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/',               access: ['permitAll']],
	[pattern: '/dbconsole/**',   access: ['permitAll']],
	[pattern: '/user/**',        access: ['ROLE_ADMIN','ROLE_MOD']],
    [pattern: '/role/**',        access: ['ROLE_ADMIN','ROLE_MOD']],
    [pattern: '/userRole/**',    access: ['ROLE_ADMIN','ROLE_MOD']],
	[pattern: '/groupe/**',      access: ['permitAll']],
	[pattern: '/groupepoi/**',   access: ['permitAll']],
	[pattern: '/image/**',       access: ['permitAll']],
	[pattern: '/location/**',    access: ['permitAll']],
	[pattern: '/point/**',       access: ['permitAll']],
	[pattern: '/error',          access: ['permitAll']],
	[pattern: '/index',          access: ['permitAll']],
	[pattern: '/index.gsp',      access: ['permitAll']],
    [pattern: '/user/profile',   access: ['ROLE_ADMIN','ROLE_MOD','ROLE_USER']],
	[pattern: '/shutdown',       access: ['permitAll']],
	[pattern: '/assets/**',      access: ['permitAll']],
	[pattern: '/**/js/**',       access: ['permitAll']],
	[pattern: '/**/css/**',      access: ['permitAll']],
	[pattern: '/**/images/**',   access: ['permitAll']],
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

