# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create([{username: "Mike", password: "123"},{username: "Lucas", password: "456"}])

post = Post.create([{title: "First post" , url: "abc", user: user.first}, {title: "Second post" , url: "abc", user: user.second}]) 

comment = Comments.create