class App.Views.MainFooter extends Backbone.View
	template			: JST['layout/main_footer']
	
	render: ->
		$(@el).html(@template())
		this

	activate: ->
		@$('#progress_bar').removeClass('progress-inactive').addClass('active')

	deactivate: ->
		@$('#progress_bar').addClass('progress-inactive').removeClass('active')