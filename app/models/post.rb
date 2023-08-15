class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :post_points

  acts_as_votable
end
