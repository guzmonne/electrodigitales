class SessionsController < ApplicationController
  respond_to :json

  def create
  	@user = User.find_by_email(params["email"])
  	if @user && @user.authenticate(params["password"])
  		session["user_id"] = @user.id
  		respond_with @user
  	end
  end
end
