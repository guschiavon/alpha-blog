# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

(1..6).each do |id|
    Portfolio.create!(
        title: Faker::Company.name,
        description: Faker::Lorem.paragraph(sentence_count: 2),
        tech: Faker::ProgrammingLanguage.name
    )
end

(1..5).each do |article|
    Article.create!(
      title: Faker::ChuckNorris.fact,
      description: Faker::Lorem.paragraph(sentence_count: 5),
      user_id: 8
    )
end
