class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :comment_points

  acts_as_votable
end
