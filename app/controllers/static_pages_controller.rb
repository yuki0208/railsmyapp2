class StaticPagesController < ApplicationController
  def home
    @post = Post.new
  end

  def help
  end
end
