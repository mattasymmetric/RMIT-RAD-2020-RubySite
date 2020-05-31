# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Topic.destroy_all

news = Topic.create!(name: "News")
analysis = Topic.create!(name: "Analysis")
discussion = Topic.create!(name: "Discussion")
fluff = Topic.create!(name: "Fluff")
media = Topic.create!(name: "Media")
meme = Topic.create!(name: "Meme")
misc = Topic.create!(name: "Misc")
opinion = Topic.create!(name: "Opinion")
update = Topic.create!(name: "Update")

User.destroy_all

User.new(displayname: "RAD", email: "rad", phone: "1234567891", password: "Rails2020", password_confirmation: "Rails2020", admin: true, lastlogin: Time.now).save(validate: false)
  
js = User.create!(displayname: "John Smith", email: "j.smith@gmail.com", phone: "1234567891", password: "SecurePassword", password_confirmation: "SecurePassword", lastlogin: Time.now)
bs = User.create!(displayname: "Bart Simpson", email: "b.simpson@gmail.com", phone: "1234567891", password: "SecurePassword", password_confirmation: "SecurePassword", lastlogin: Time.now)
hs = User.create!(displayname: "Homer Simpson", email: "h.simpson@gmail.com", phone: "1234567891", password: "SecurePassword", password_confirmation: "SecurePassword", lastlogin: Time.now)
dc = User.create!(displayname: "Dale Cooper", email: "d.cooper@gmail.com", phone: "1234567891", password: "SecurePassword", password_confirmation: "SecurePassword", lastlogin: Time.now)
dj = User.create!(displayname: "Ducky Jones", email: "d.jones@gmail.com", phone: "1234567891", password: "SecurePassword", password_confirmation: "SecurePassword", lastlogin: Time.now)

99.times do |n| 
  displayname = "Test Name #{n+1}"
  email = "example-#{n+1}@email.com"
  phone = "1234567891"
  password = "SecurePassword"
  User.create!(displayname: displayname, email: email,phone: phone, password: password, password_confirmation: password, lastlogin: Time.now)
end

Post.create!(title: "Something smelly", content: "Smelly News Topic.", topic: news, views: 10, user: js)
Post.create!(title: "An Opinionated Opinion", content: "Look this is just an opinion, honestly.", topic: opinion, views: 12, user: dc)
Post.create!(title: "Fluffy Bunny Story", content: "ahah just kidding this article is just fluff.", topic: fluff, views: 5, user: hs)
Post.create!(title: "Coffee IS the best", content: "Coffee. Coffee. Coffee. Coffee. Coffee.", topic: analysis, views: 666, user: dj)
Post.create!(title: "News News News", content: "Today in news is today in news is today in news is today in news is today in news is today.", topic: news, views: 55, user: bs)