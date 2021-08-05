# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  username: 'user1',
  nickname: 'nickname1',
  email: 'test@sample.com'
)

10.times do |num|
  num += 1
    user.oogiris.create!(
        title: "Document #{num}",
        oogiri: "oogiri #{num}",
        description: "samplsamplesamplesamplesamplesamplesample", 
        user_id: User.find.first,
      )
end