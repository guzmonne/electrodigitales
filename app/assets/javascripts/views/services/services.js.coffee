class App.Views.Services extends Backbone.View 
	name					: "Services"
	template			: JST['services/services']
	breadCrumbs		: JST['layout/services_breadcrumbs']
	
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
				template = "services"
		# Update the Side Nav
		@$('li.active').removeClass('active')
		@$("[data-template=#{template}]").parent().addClass('active')
		# Change the contentView Views
		switch template
			when "index"
				view = new App.Views.ServicesIndex()
				break
			when "clients"
				view = new App.Views.Clients()
				break
		Backbone.history.navigate "services#{'/' + template unless template == "services" }"
		App.render({region: "contentView", view: view})
		this