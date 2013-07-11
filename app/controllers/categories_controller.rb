class CategoriesController < ApplicationController

	def index
		@categories = Category.all

	end

	def show
		@category = Category.find(params[:id])
		@post = Post.find(params[:id])

	end

	def new
		@category = Category.new

	end

	def create
		@category = Category.new(params[:category].permit!)
		if @category.save
			redirect_to categories_path, notice: "You have successfully created a new Category!!"
		else
			render :new
		end

	end

	def edit
		@category = Category.find(params[:id])

	end

	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category].permit!)
			redirect_to categories_path, notice: "Category has been successfully updated!!"
		else
			render :edit
		end


	end




end