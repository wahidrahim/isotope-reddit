class SessionsController < ApplicationController
  def create
    begin
      reddit.sign_in params[:username], params[:password]
    rescue
      error_msg = "&nbsp; <i class='fa fa-exclamation-circle'></i> Invalid username or password!".html_safe
      redirect_to root_path, flash: {error: error_msg} and return
    end

    success_msg = "&nbsp; <i class='fa fa-sign-in'></i> Logged in as #{reddit.current_user.name}!".html_safe
    redirect_to root_path, flash: {success: success_msg}
  end

  def destroy
    username = reddit.current_user.name
    reddit.sign_out

    logout_msg = "&nbsp; <i class='fa fa-sign-out'></i> Logged out as #{username}".html_safe
    redirect_to root_path, flash: {notice: logout_msg}
  end
end
