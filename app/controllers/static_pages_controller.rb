class StaticPagesController < ApplicationController
  def home
    @post = Post.new
    @users = User.order(updated_at: :desc).paginate(page: params[:page])
  end

  def help
  end
end
