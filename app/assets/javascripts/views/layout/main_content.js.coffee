class App.Views.SignIn extends Backbone.View
	template			: JST['layout/sign_in']
	name					: "SignIn"
	
	initialize: ->
		@i = 0
	
	events:
		"submit #sign_in_form" 		: "logIn"

	render: ->
		$(@el).html(@template())
		this

	logIn: (e) ->
		e.preventDefault()
		App.regions.footer.activate()
		attributes = 
			email				: @$('[name=email]').val()
			password		: @$('[name=password]').val()
		App.session.save attributes, success: (model, data, response) =>
			App.user.set data
			if @$('[type=checkbox]').is(':checked') then App.user.rememberMe()
			unless App.started then App.start()
			App.regions.footer.deactivate()
			Backbone.history.navigate "users/user_panel", trigger: true
			App.setNav(new App.Views.LoggedInNav) 