class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_secure_password validations: false
	validates :password, presence: true, length: {minimum: 4}
	validates :username , presence: true, length: {minimum: 4}, uniqueness: true
	has_many :votes
	

def already_voted_on?(obj)
      self.votes.where(voteable: obj).size >=1
      
      
    end

    
    
end