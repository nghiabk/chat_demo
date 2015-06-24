# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create! name: "Hung", email: "hung@gmail.com", password: "hung12345", password_confirmation: "hung12345"

10.times do |n|
	User.create! name: "User#{n+1}", email: "sample_#{n+1}@email.com",
		password: "12345678", password_confirmation: "12345678"
end

current_user = User.first
users = User.not_current_user current_user
users.each do |user|
	current_user.conversations.create! receiver: user
end

@conversation = Conversation.first
@user = User.first
20.times do |n|
  Message.create! conversation: @conversation, user: @user,
    content: "#{n+1}. #{@user.name} send a message to #{@conversation.receiver.name}"
end
