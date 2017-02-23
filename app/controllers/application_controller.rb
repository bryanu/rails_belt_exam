class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #URL_DASHBOARD = "/dashboard"
  URL_NEWUSER = "/sessions/new"
  URL_SONGS   = "/songs"

  def currUser
      @currUser = User.find(session[:userID]) if session[:userID]
  end

end
