class App.Routers.Main extends Backbone.Router
	
	routes:
		'services/:section'				: 'services'
		'services'								: 'services'
		'users/:section'					: 'users'
		'users'										: 'users'
		'login'										: 'login'
		''												: 'home'

	users: (section) ->
		section = "" if section == null	
		content	= new App.Views.Home()
		App.setContent(content)
		content.changePage(null, section)
		this			

	services: (section) ->
		section = "" unless section?	
		content	= new App.Views.Services()
		App.setContent(content)
		App.regions.header.activate('services')
		content.changePage(null, section)
		this

	login: ->
		App.setNav()
		App.setContent()
		App.setFooter()
		this

