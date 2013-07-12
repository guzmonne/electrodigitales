class App.Views.ClientsNew extends Backbone.View 
	template			: JST['services/client_form']
	name					: "ClientsNew"

	events: 
		"submit form"				: 'clientSave'

	initialize: ->
		@model 				= new App.Models.Client()
		@modelBinder 	= new Backbone.ModelBinder() 

	render: ->
		$(@el).html(@template())
		@modelBinder.bind @model, $(@el)
		App.fh.setFocus('[name=name]') 
		Backbone.history.navigate "services/clients/new"
		this

	remove: ->
		@modelBinder.unbind()
		super()
		
	clientSave: (e) ->
		e.preventDefault()
		@model.set({updated_by: App.user.id, created_by: App.user.id})
		@model.save @model.attributes, success: (model, data, status) =>
			@$('form')[0].reset()
			alert "El cliente se ha creado con exito."
			@$('[name=name]').focus()
			App.vent.trigger "client:create:success", @model
			@initialize()
			@modelBinder.bind @model, $(@el)