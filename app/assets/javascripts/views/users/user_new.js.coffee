class App.Views.UserNew extends Backbone.View
	template			: JST['users/user_new']
	name					: "UserNew"

	initialize: ->
		@model 				= new App.Models.User()
		@modelBinder 	= new Backbone.ModelBinder() 

	events: 
		'click #show_more_data'		: 'showMoreData'
		'submit form'							: 'newUser'

	render: ->
		$(@el).html(@template())
		@$('[name=email]').focus()
		@modelBinder.bind @model, $(@el) 
		this

	remove: ->
		super()
		@modelBinder.unbind()

	showMoreData: (e) ->
		e.preventDefault()
		@$('#more_data').fadeIn('slow').removeClass('hide')
		@$('[name=name]').focus()
		@$('#show_more_data').fadeOut('slow').remove()

	newUser: (e) ->
		e.preventDefault()
		@model.set({password_confirmation: @$('[name=confirm]').val() ,updated_by: App.user.id, created_by: App.user.id})
		@model.save @model.attributes, success: (model, data, status) =>
			@$('form')[0].reset()
			alert "El usuario se ha creado con exito."
			@$('[name=email]').focus()	