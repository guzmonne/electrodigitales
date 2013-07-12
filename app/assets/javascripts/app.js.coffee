window.App =
	Models          : {}
	Collections			: {}
	Views						: {}
	Routers					: {}
	Mixins					: {}

	vent						: _.extend {}, Backbone.Events
	regions					: {header: null, content: null, footer: null, contentView: null, formView: null}
	started					: false

	initialize: ->
		@user 				= new App.Models.User()
		@session 			= new App.Models.Session()
		@fh						= new App.Mixins.FunctionHelper()
		if @user.authenticated() 
			@user.resume => 
				@start()
		else
			@setNav()
			@setContent()
			@setFooter()

	setNav: (view) ->
		if view
			@render({region: "header", view: view})
		else
			view = new App.Views.MainNav()
			@render({region: "header", view: view})

	setContent: (view) ->
		if view
			@render({region: "content", view: view})
		else
			view = new App.Views.SignIn()
			@render({region: "content", view: view})

	setFooter: (view) ->
		if view
			@render({region: "footer", view: view})
		else
			view = new App.Views.MainFooter()
			@render({region: "footer", view: view})

	render: (options) ->
		unless App.user.authenticated then Backbone.history.navigate 'login', trigger: true
		unless options and options.region and options.view then return
		region = options.region
		view = options.view
		unless _.keys(@regions).indexOf(region) > -1 then return
		@close @regions[region] if @regions[region]?  
		@regions[region] = view
		$('#' + region).html(view.render().el)

	close: (view) ->
		view.stopListening()
		if view.close? then view.close
		view.off()
		view.remove()

	start: ->
		new App.Routers.Main()
		@setFooter() unless App.regions.footer?
		@setNav(new App.Views.LoggedInNav())
		Backbone.history.start()
		@started = true

	restart: ->
		Backbone.history.navigate 'login', trigger: true
		App.user.forgetMe()
		App.user 		= new App.Models.User()
		App.session	= new App.Models.Session()

$(document).ready ->
	App.initialize()
