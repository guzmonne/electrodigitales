class App.Views.Home extends Backbone.View
	name					: "Home"
	template			: JST['layout/home']

	events: 
		"click li a"				: 'changePage'

	render: ->
		$(@el).html(@template())
		this

	changePage: (e, page) ->
		# Get template variable or use default
		if e?
			e.preventDefault()
			template = e.currentTarget.dataset["template"]
		else
			if page != "" and page
				template = page 
			else 
				template = "user_panel"
		# Update the Side Nav
		@$('li.active').removeClass('active')
		@$("[data-template=#{template}]").parent().addClass('active')
		# Change the contentView Views
		switch template
			when "user_panel"
				view = new App.Views.UserPanel()
				break
			when "user_new"
				view = new App.Views.UserNew()
			when "user_edit"
				view = new App.Views.UserEdit()
				break
			when "user_change_password"
				view = new App.Views.UserChangePassword()
				break
		Backbone.history.navigate "users#{'/' + template}"
		App.render({region: "contentView", view: view})
		this