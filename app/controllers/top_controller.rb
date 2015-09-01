class TopController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  def index
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(text: create_params[:text], user_id: current_user.id)
  end

  def create_params
    params.require(:post).permit(:text)
  end
end