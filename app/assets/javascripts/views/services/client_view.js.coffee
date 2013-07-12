class App.Views.Client extends Backbone.View
  template: JST['services/client']
  tagName: 'tr'
  name: 'Client'

  initialize: ->
    @listenTo App.vent, "remove:appended:views", => @remove()
    @modelBinder  = new Backbone.ModelBinder() 

  events:
    'dblclick': 'show'

  render: ->
    $(@el).html(@template(model: @model))
    @modelBinder.bind @model, $(@el) 
    this

  show: ->
    view = new App.Views.ClientsEdit(model: @model)
    App.render({region: "contentView", view: view})
    this

  remove: ->
    @modelBinder.unbind() if @modelBinder?
    @off()
    super()
    
