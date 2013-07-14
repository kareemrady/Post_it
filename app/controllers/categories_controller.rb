class CategoriesController < ApplicationController
before_action :find_category, only: [:show, :edit, :update]
before_action :require_user, only:[:show, :edit, :update]
	def index
		@categories = Category.all

	end

	def show
		
		@p = @category.posts

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
		
	end

	def update
		
		if @category.update_attributes(params[:category].permit!)
			redirect_to categories_path, notice: "Category has been successfully updated!!"
		else
			render :edit
		end


	end

private

def find_category
	@category = Category.find(params[:id])
end

end