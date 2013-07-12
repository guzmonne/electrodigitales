class App.Views.ClientsEdit extends Backbone.View 
	template			: JST['services/client_form']
	name					: "ClientsEdit"

	events: 
		"submit form"				: 'clientUpdate'

	initialize: ->
		@modelBinder 	= new Backbone.ModelBinder() 

	render: ->
		$(@el).html(@template()).find
		@modelBinder.bind @model, $(@el)
		@$('#save').addClass('hide') 
		@$('#edit').removeClass('hide')
		App.fh.setFocus('[name=name]')
		Backbone.history.navigate "services/clients/edit/#{@model.id}"
		this

	remove: ->
		@modelBinder.unbind()
		super()
		
	clientUpdate: (e) ->
		e.preventDefault()
		@model.set({updated_by: App.user.id, created_by: App.user.id})
		@model.save @model.attributes, success: (model, data, status) =>
			alert "El cliente se ha actualizado con exito."
			@$('[name=name]').focus()