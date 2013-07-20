class CommentsController < ApplicationController
	before_action :find_post, only: [:new, :create, :vote]
	before_action :find_comment, only: [:vote]
	before_action :require_user, only: [:new, :create, :vote]

	def new
				
		@comment = Comment.new
		
	end

	def create
		@user = User.find(session[:user_id])		
		@comment = @post.comments.build(params[:comment].permit!)
					
				
		if @comment.save
			@user.comments << @comment
			redirect_to post_path(@post), notice: "Comment successfully published!!"
		else
			render :new
		end
	end

	def vote
		
		Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
		redirect_to :back, notice: "Your vote has been successfully submitted!!"

	end

	private

	def find_post
		@post = Post.find(params[:post_id])
	end

	def find_comment

		@comment = Comment.find(params[:id])
	end



	
end