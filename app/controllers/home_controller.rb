class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.order('id DESC')
    # @user = User.find(params[:id])
  end
end
