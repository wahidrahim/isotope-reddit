class SessionsController < ApplicationController
  def create
    #TODO handle invalid credentials
    session[:reddit].sign_in params[:username], params[:password]

    redirect_to root_path
  end

  def destroy
    session[:reddit].sign_out

    redirect_to root_path
  end
end
