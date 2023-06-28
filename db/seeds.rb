# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create([{username: "Mike", password: "123"},{username: "Lucas", password: "456"}, {username: "Andreia", password: "789"}])

post = Post.create([{title: "First post" , url: "abc", user: user.first}, {title: "Second post" , url: "abc", user: user.second},{title: "Third post" , url: "aaa", user: user.third}]) 

comment = Comments.create([{comment: "qwert", user_id: user.third , post_id: post.first},{comment: "asdf", user_id: user.second , post_id: post.first},{comment: "zxcv", user_id: user.first, post_id: post.second},{comment: "yuiop", user_id: user.second, post_id: post.third}])

comment_point = CommentPoint.create([{user_id: user.first, comment_id: comment.first, value: true},{user_id: user.second, comment_id: comment.first , value: true},{user_id: user.third, comment_id: comment.first , value: false},{user_id: user.first, comment_id: comment.second, value: true}, {user_id: user.first, comment_id: comment.third, value: true}, {user_id: user.first, comment_id: comment.fourth, value: true}])

post_point = PostPoint.create([{user_id: user.second , post_id: post.first , value: true}, {user_id: user.third, post_id: post.second, value: true}, {user_id: user.first, post_id: post.third, value: true}])