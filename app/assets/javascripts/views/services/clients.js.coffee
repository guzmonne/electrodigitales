class App.Views.Clients extends Backbone.View 
	template			: JST['services/clients']
	name					: "Clients"

	initialize: ->
		@collection = new App.Collections.Clients()
		@listenTo @collection, "reset", => @appendCollection()
		@listenTo @collection, "add", (model) => @appendModel(model)
		@listenTo App.vent, "client:create:success", (model) =>
			@collection.add(model)
	
	events: 
		"click #client_new"				: 'clientNew'

	render: ->
		$(@el).html(@template())
		@collection.fetch()
		this

	clientNew: (e) ->
		e.preventDefault()
		view = new App.Views.ClientsNew()
		App.render({region: "contentView", view: view})
		this

	appendCollection: ->
		@collection.each(@appendModel)

	appendModel: (model) ->
		view = new App.Views.Client(model: model)
		@$('#clients').append view.render().el
		this

	close: ->
		App.vent.trigger "remove:appended:views"