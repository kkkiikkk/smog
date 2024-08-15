# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
AdminUser.create!(email: 'ruddnovskiy@gmail.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
images = Image.all.take(5)
user = User.all[0]

images.each_with_index do |image, index|
  create_like_command = CreateLikeCommand.new(user, image, 'seed')
  create_like_command.perform
  comment = image.comments.build(caption: "New Comment #{index}")
  comment.user = user
  comment.save
end