class CommentsController < ApplicationController

	def new
		
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		

	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(params[:comment].permit!)
					
		
		
		
		if @comment.save
			redirect_to post_path(@post), notice: "Comment successfully published!!"
		else
			render :new
		end
	end

end