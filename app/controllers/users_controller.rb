class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      flash[:alert] = user.errors.full_messages.to_sentence

      redirect_to "/register"
    end
  end

  private

  def user_params
    params.permit(:user_name, :email)
  end
end