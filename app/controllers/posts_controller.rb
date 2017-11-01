class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy, :edit]

  def index
    @posts = current_user.posts.order(created_at: 'desc')
  end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = current_user.posts.build
	end

	def create
	  @post = current_user.posts.build(post_params)
    Rails.logger.info @post.inspect
		if @post.save
      flash[:success] = "Post created!"
    	redirect_to current_user
    else
      render 'new'
    end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
    @post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to current_user
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
    flash[:success] = "Post deleted"
		redirect_to request.referrer || root_url
	end

 private

		def post_params
			params.require(:post).permit(:title, :body, :id, :user_id)
		end

    def correct_user
      @post = current_user.posts.find_by(id:params[:id])
      redirect_to root_url if @post.nil?
    end
end
