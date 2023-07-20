class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :post_points
  has_many :comment_points

 # adds virtual attributes for authentication
 has_secure_password
 # validates email
 validates :username, presence: true, uniqueness: true
end
