class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_secure_password validations: false
	validates :password, presence: true, length: {minimum: 4}
	validates :username , presence: true, length: {minimum: 4}, uniqueness: true

end