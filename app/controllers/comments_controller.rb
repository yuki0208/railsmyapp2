class CommentsController < ApplicationController
  def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.persisted?
    	 redirect_to post_path(@post)
    else
       render 'posts/show'
    end
  end

  def destroy
	  @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

 private

  def comment_params
	  params.require(:comment).permit(:commenter, :body)
	end
end
