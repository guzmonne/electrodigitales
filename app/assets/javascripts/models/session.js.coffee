class App.Models.Session extends Backbone.Model 
	urlRoot: '/api/sessions'

	url: ->
		u = '/api/sessions'
		if @id then u = u + "/#{@id}"
		return u