class CommentsController < ApplicationController
	
	#http_basic_authenticate_with name: "SpaceBoxers", password: "theworst", only: [:destroy]
	before_action :set_post
	before_action :set_comment, only: [:destroy]
 	before_action :Correct_user, only: [:destroy]

	def create
		#@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		@comment.user_id = current_user.id
		redirect_to post_path(@post)
	end

	def destroy
		#@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
	def comment_params
		params.require(:comment).permit(:username, :body)
	end

	def set_post
		@post = Post.find(params[:post_id])
	end

	def set_comment
		@comment = @post.comments.find(params[:id])
	end
end

def Correct_user
  @comment = current_user.comments.find_by(id: params[:id])
  redirect_to post_path(@post), notice: "You can't edit this comment" if @post.nil?
end