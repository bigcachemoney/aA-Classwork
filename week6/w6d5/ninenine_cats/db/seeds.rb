# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

garfield = Cat.create!(name: 'Garfield', birth_date: Date.new(2000,1,1), color: "orange", sex: "M", description: "lasagna lover")
lomein = Cat.create!(name: 'LoMein', birth_date: Date.new(2010,1,1), color: "black", sex: "F", description: "noodle lover")

