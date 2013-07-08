class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])

  end

  def new
  	@post = Post.new

  end

  def create
  	@post = Post.new(params[:post].permit!)
  	if @post.save
  		redirect_to root_path, notice: "You have successfully created a post!"
  	else
  		render :new
  	end
  end

  def edit
    @post = Post.find(params[:id])

  end

  def update
    
   @post = Post.find(params[:id])
   
    if @post.update_attributes(params[:post].permit!)
      redirect_to root_path, notice: "You have successfully updated your post!"
    else
      render :edit
    end
  end

  
end
