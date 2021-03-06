#https://www.youtube.com/watch?v=DoxUiqUpkw4 This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'user@example.com',
                    password: 'pass123',
                    password_confirmation: 'pass123')

20.times do |n|
  user.posts.create(title: "post number #{n} title",
                    subtitle: "post number #{n} subtitle",
                    content: "Lorem ipsum.")
end

Post.find(20).update_attributes(video_link: 'https://www.youtube.com/watch?v=RM81QMccy_w')
Post.find(19).update_attributes(image: File.new('spec/images_for_testing/test_image_1.gif'))
Post.find(18).update_attributes(image: File.new('spec/images_for_testing/test_image_2.gif'))
Post.find(17).update_attributes(video_link: 'https://www.youtube.com/watch?v=xUmndwXJfbk')
Post.find(16).update_attributes(image: File.new('spec/images_for_testing/test_image_3.gif'))
