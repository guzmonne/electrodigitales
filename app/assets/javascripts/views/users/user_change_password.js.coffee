class App.Views.UserChangePassword extends Backbone.View
	template			: JST['users/user_change_password']
	name					: "UserChangePassword"

	initialize: ->		
		@modelBinder = new Backbone.ModelBinder()

	events: 
		'click #show_more_data'		: 'showMoreData'
		'submit form'							: 'changePassword'

	render: ->
		$(@el).html(@template())
		@$('[name=password]').focus()
		@modelBinder.bind App.user, $(@el) 
		this

	remove: ->
		super()
		@modelBinder.unbind()

	changePassword: (e) ->
		e.preventDefault()
		App.user.set({password_confirmation: @$('[name=confirm]').val() ,updated_by: App.user.id})
		App.user.save App.user.attributes, success: (model, data, status) =>
			@$('form')[0].reset()
			alert "La contraseña se ha cambiado con exito."
			@$('[name=password]').focus()	