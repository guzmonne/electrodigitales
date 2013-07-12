class ClientsController < ApplicationController
 	respond_to :json

	def index
		respond_with Client.all
	end

	def create
		respond_with Client.create(params["client"])
	end

	def update
		respond_with Client.update(params["id"],params["client"])
	end
end
