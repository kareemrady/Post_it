class Post < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: :user_id
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
	validates :title, presence: true, length: {minimum: 5}
	validates :url, presence: true
	validates :description, presence: true, length: {maximum: 140}
	has_many :votes, as: :voteable
	

	def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false).size
  end
  
  
 
end