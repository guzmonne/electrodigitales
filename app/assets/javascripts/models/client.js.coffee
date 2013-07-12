class App.Models.Client extends Backbone.Model 
	urlRoot: '/api/clients'

	url: ->
		u = '/api/clients'
		if @id then u = u + "/#{@id}"
		return u