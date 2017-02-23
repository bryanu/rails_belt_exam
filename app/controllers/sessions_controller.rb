class SessionsController < ApplicationController

  def new
    render URL_NEWUSER
  end

  def login
    if !user = User.find_by(email: params_email)
      flash[:email_error] = "Email address does not exist, please register."
      redirect_to URL_NEWUSER
    else
      if user.authenticate(params[:user][:password])
        session[:userID] = user.id
        redirect_to URL_SONGS
      else
        flash[:password_error] = "Invalid credentials!"
        redirect_to URL_NEWUSER
      end
    end
  end

  def logout
    @currUser = nil
    session[:userID] = nil
    redirect_to URL_NEWUSER
  end

  def params_email
    params[:user][:email].downcase
  end

end
