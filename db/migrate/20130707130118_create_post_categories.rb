class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
    	t.timestamps
    	t.integer :post_id, :category_id
    end
  end
end
