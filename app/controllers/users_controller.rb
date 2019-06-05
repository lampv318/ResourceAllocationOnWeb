class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "successfully"
      redirect_to @user
    else
      render 'new'
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
