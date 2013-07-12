class App.Views.MainNav extends Backbone.View
	template			: JST['layout/main_nav']
	className			: "pure-menu pure-menu-open pure-menu-fixed pure-menu-horizontal"

	render: ->
		$(@el).html(@template())
		this