class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(current_user.id)
    @posts = @user.posts.order(id: :DESC)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    current_user.update(update_params)
  end

  def update_params
    params.require(:user).permit(:profile)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

end
