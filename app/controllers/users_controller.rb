class UsersController < ApplicationController

  def new
  end

  def show
    unless current_user
      flash[:alert] = "You must be logged in to view this page."
      redirect_to root_path
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to "/register"
    end
  end

  def login_form
  end

def login_user
  user = User.find_by!(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    flash[:success] = "Welcome #{user.user_name}!"
    redirect_to dashboard_path
  else
    flash[:error] = "Sorry, your credentials are bad."
    render :login_form
  end
end

def logout
  reset_session
  flash[:success] = "You have been logged out."
  redirect_to '/'
end



  private

  def user_params
    params.permit(:user_name, :email, :password, :password_confirmation)
  end
end