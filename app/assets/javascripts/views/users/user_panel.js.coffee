class App.Views.UserPanel extends Backbone.View
	template			: JST['users/user_panel']
	name					: "UserPanel"

	render: ->
		$(@el).html(@template())
		this