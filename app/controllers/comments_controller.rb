class CommentsController < ApplicationController

	def new
		
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		

	end

	def create
		@comment = Comment.new(params[:comment].permit!)
		
		@post = Post.find(params[:post_id])
		
		
		if @post.comments << @comment
			redirect_to post_path(@post), notice: "Comment successfully published!!"
		else
			render :new
		end
	end

end