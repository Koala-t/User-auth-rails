class UsersController < ApplicationController

  def new
  end

  def show
    @user = current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Something doesn't seem right. Make sure you include a username and email."
      redirect_to '/users/new'
    end
  end

private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
