class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :post_points
  has_many :comment_points
end
