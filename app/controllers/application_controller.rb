class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def require_login
    if session[:user_id] == nil
      redirect_to '/sessions/new'
    end
  end

  def require_correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to "sessions/new"
    end
  end



end
