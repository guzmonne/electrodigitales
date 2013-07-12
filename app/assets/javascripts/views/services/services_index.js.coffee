class App.Views.ServicesIndex extends Backbone.View 
	template			: JST['services/services_index']
	name					: "ServicesIndex"

	render: ->
		$(@el).html(@template())
		console.log "Rendered!"
		this