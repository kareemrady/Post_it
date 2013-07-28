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

	def user_comments
		
		listed_based_on_votes

	end


	def vote
		respond_to do |format|
      format.js do 
        if current_user.already_voted_on?(@comment)
          render js: "alert('You have already voted')"          
        else
          Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
        end
      end
    end
  end  

	

	private

	def find_post

		@post = Post.find(params[:post_id])
	end

	def find_comment

		@comment = Comment.find(params[:id])
	end

	def listed_based_on_votes
    @a = []
    current_user.comments.each do |comment|
      @a << {:votes => comment.total_votes, :id => comment.id}
    end
    l = @a.sort_by {|h| -h[:votes]}
     m = []
    l.each do |comment|
      c = Comment.find(comment[:id])
      m << c
    end
    @comments = m   

  end

	
end