class App.Views.LoggedInNav extends Backbone.View
	template			: JST['layout/logged_nav']
	className			: "pure-menu pure-menu-open pure-menu-fixed pure-menu-horizontal"  

	events:
		'click #users'							: 'users'
		'click #services'						: 'services'
		'click #sign_out'						: 'signOut'

	render: ->
		$(@el).html(@template())
		this

	signOut: (e) ->
		e.preventDefault()
		App.restart()

	activate: (item) ->
		@$('.active').removeClass('active')
		@$('#' + item).addClass('active')

	users: (e) ->
		e.preventDefault()
		@activate('users')
		Backbone.history.navigate 'users/user_panel', true

	services: (e) ->
		e.preventDefault()
		@activate('services')
		Backbone.history.navigate 'services/index', true