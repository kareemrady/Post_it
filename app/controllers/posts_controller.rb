class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
  	@posts = Post.all
  end

  def show
  	
  end

  def new
  	@post = Post.new

  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to root_path, notice: "You have successfully created a post!"
  	else
  		render :new
  	end
  end

  def edit
    
  end

  def update
    
     
    if @post.update_attributes(params[:post].permit!)
      redirect_to root_path, notice: "You have successfully updated your post!"
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def post_params
      params.require(:post).permit(:title, :url, :description)
    end

  
end
