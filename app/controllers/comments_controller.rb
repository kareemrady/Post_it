class CommentsController < ApplicationController
	before_action :find_comment, only: [:new, :create]
	def new
		
		
		@comment = Comment.new
		

	end

	def create
		
		@comment = @post.comments.build(params[:comment].permit!)
					
				
		if @comment.save
			redirect_to post_path(@post), notice: "Comment successfully published!!"
		else
			render :new
		end
	end
	def find_comment
		@post = Post.find(params[:post_id])
	end

end