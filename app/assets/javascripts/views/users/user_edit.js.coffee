class App.Views.UserEdit extends Backbone.View 
	template			: JST['users/user_edit']
	name					: "UserEdit"

	initialize: ->
		@modelBinder = new Backbone.ModelBinder()

	events: 
		'click #edit_email'		: 'editEmail'
		'submit form'					: 'editUser'

	render: ->
		$(@el).html(@template())
		@modelBinder.bind App.user, $(@el) 
		this

	remove: ->
		super()
		@modelBinder.unbind()

	editEmail: (e) ->
		@$('[name=email]').attr('disabled', false)
		@$('#edit_email').fadeOut('slow').remove()

	editUser: (e) ->
		e.preventDefault()
		App.user.save App.user.attributes, success: (model, data, status) =>
			alert "Se han actualizado los datos con exito."	