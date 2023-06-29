# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = User.create([{username: "Mike", password: "123"},{username: "Lucas", password: "456"}, {username: "Andreia", password: "789"}])

posts = Post.create([{title: "First post" , url: "abc", user: users.first}, {title: "Second post" , url: "abc", user: users.second},{title: "Third post" , url: "aaa", user: users.third}]) 

comments = Comment.create([{comment: "qwert", user: users.third , post: posts.first},{comment: "asdf", user: users.second , post: posts.first},{comment: "zxcv", user: users.first, post: posts.second},{comment: "yuiop", user: users.second, post: posts.third}])

comment_points = CommentPoint.create([{user: users.first, comment: comments.first, value: true},{user: users.second, comment: comments.first , value: true},{user: users.third, comment: comments.first , value: false},{user: users.first, comment: comments.second, value: true}, {user: users.first, comment: comments.third, value: true}, {user: users.first, comment: comments.fourth, value: true}])

post_points = PostPoint.create([{user: users.second , post: posts.first , value: true}, {user: users.third, post: posts.second, value: true}, {user: users.first, post: posts.third, value: true}])