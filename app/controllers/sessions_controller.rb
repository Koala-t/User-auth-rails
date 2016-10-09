class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Something doesn't add up! Check your email and password."
      redirect_to '/sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/sessions/new'
  end

  private
  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
