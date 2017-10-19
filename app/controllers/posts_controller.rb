class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.all(created_at: 'desc')
  end

	def show
		@post = current_user.posts.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = current_user.posts.build(post_params)
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
		redirect_to current_user
	end

 private

		def post_params
			params.require(:post).permit(:title, :body, :id, :user_id)
		end
end
