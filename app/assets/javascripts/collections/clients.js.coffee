class App.Collections.Clients extends Backbone.Collection
  model: App.Models.Client
  url: '/api/clients'

  comparator: (client) -> 
  	return client.get('name')