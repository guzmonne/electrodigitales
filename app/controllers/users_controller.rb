class UsersController < ApplicationController
 	respond_to :json

	def index
		if params["auth_token"]
			return respond_with User.find_by_auth_token(params["auth_token"])
		end
		@user = User.new(params["user"])
		if @user.save
			respond_with @user
		end
	end

	def create
		respond_with User.create(params["user"])
	end

	def update
		respond_with User.update(params["id"],params["user"])
	end
end
