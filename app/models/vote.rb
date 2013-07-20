class Vote < ActiveRecord::Base
	belongs_to :creator, class_name: "User", foreign_key: :user_id
	belongs_to :voteable, polymorphic: true


def total_votes
    self.votes.where(vote: true).size - self.votes.where(vote: false)
  end
end