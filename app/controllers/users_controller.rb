class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to '/dashboard/index'
    else
      flash[:errors] = user.errors.full_messages
      redirect_to '/sessions/new'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
