# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#   
User.destroy_all
Friendship.destroy_all

eric = User.create!(name: 'eric', email: 'eric@mail.com', password: 'foobar')
cam = User.create!(name: 'cam', email: 'cam@mail.com', password: 'foobar')
doug = User.create!(name: 'doug', email: 'doug@mail.com', password: 'foobar')
jo = User.create!(name: 'jo', email: 'jo@mail.com', password: 'foobar')

#eric and cam, already friends.
friendship1a = Friendship.create!(user_id: eric.id, friend_id: cam.id)
friendship1b = Friendship.create!(user_id: cam.id, friend_id: eric.id)

#eric and doug, doug requested eric.
friendship2a = Friendship.create!(user_id: doug.id, pending_friend_id: eric.id)
friendship2b = Friendship.create!(user_id: eric.id, requesting_friend_id: doug.id)

#jo requested doug
friendship3a = Friendship.create!(user_id: doug.id, pending_friend_id: jo.id)
friendship3b = Friendship.create!(user_id: jo.id, requesting_friend_id: doug.id)


#eric's posts
post1 = eric.posts.create!(body: "this is eric's first post", user_id: eric.id)

#cam's posts
post2 = cam.posts.create!(body: "this is cam's first post", user_id: cam.id)
