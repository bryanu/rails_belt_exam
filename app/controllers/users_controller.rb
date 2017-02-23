class UsersController < ApplicationController

  def create

    user = User.new(user_params)

    if user.valid?
      user.save
      session[:userID] = user.id
      redirect_to URL_SONGS
    else
      @user_first_name  = params['user']['first_name']
      @user_last_name   = params['user']['last_name']
      @user_email       = params['user']['email']
      @user_password    = params['user']['password']

      # puts "\n\n\n #{params['user']['first_name']} \n\n\n"
      # puts "\n\n\n #{user.errors.messages} \n\n\n"
      flash.clear

      if user.errors.messages[:first_name].size > 0
        flash[:first_name] = "First name must be at least 2 characters long."
      end
      if user.errors.messages[:last_name].size > 0
        flash[:last_name] = "Last name must be at least 2 characters long."
      end
      if user.errors.messages[:email].size > 0
        flash[:email] = "A valid email is required."
      end
      if user.errors.messages[:password].size > 0
        flash[:password] = "Password is required.  Must be between 8 and 16 characters long."
      end
      if user.errors.messages[:password_confirmation].size > 0
        flash[:password_confirmation] = "Passwords do not match."
      end

      render URL_NEWUSER
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
