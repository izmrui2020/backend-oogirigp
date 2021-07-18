# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |num|
  num += 1
  User.create(
    name: "user #{num}"
  )
end

5.times do |num|
  num += 1
  Oogiri.create!(
      title: "Document #{num}",
      oogiri: "oogiri #{num}",
      description: "samplsamplesamplesamplesamplesamplesamplesamplesamplesamplesamplesamplesamplesample
            samplesamplesamplesamplesamplesamplesamplesamplesamplesamplesample",
      image_url: "https://sample.com",        
  )
end