class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]

  # GET /sessions/new
  def new
  end

  # POST /sessions
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render action: "new"
    end
  end

  # DELETE /sessions/1
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
