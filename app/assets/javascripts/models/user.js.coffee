class App.Models.User extends Backbone.Model 
	urlRoot: '/api/users'

	url: ->
		u = '/api/users'
		if @id then u = u + "/#{@id}"
		return u

	name: ->
		if @get('name')? then @get('name')

	email: ->
		if @get('email')? then @get('email')		

	rememberMe: ->
		$.cookie('auth_token', @get('auth_token'), { expires: 1, path: '/' })

	authenticated: ->
		if $.cookie('auth_token')? then return true else return false

	resume: (callback) ->
		return unless $.cookie('auth_token')?
		@fetch data: {auth_token: $.cookie('auth_token')}, success: =>
			callback() if callback?

	forgetMe: ->
		if @authenticated then $.removeCookie('auth_token', { path: '/' })			