# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
(1..2).map do 
  User.create!
end

(1..5).map do |i|
  image = Image.new
  filename = i.to_s + '.jpg'
  image.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
  image.save!
end

(1..5).map do |i|
  DeceasedPost.create!(
    user: User.find_by_id(i%2 + 1),
    image_ids: [i],
    name: 'ExampleBody' + i.to_s,
    gender: i%2 ? 'male': 'female',
    date_found: '2022-03-15',
    location: 'xxx.yyyyyy.zzz',
    vague_location: 'A vague location',
    description: 'this is an example deceased'
  )
end
