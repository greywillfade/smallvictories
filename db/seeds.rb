# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.create(cat_name: "Work")
Category.create(cat_name: "Hobbies")
Category.create(cat_name: "Health")
Category.create(cat_name: "Relationships")
Category.create(cat_name: "Family")
Category.create(cat_name: "Finance")
Category.create(cat_name: "Fun")
Category.create(cat_name: "Learning")
Category.create(cat_name: "Social")
Category.create(cat_name: "Personal development")
Category.create(cat_name: "Quality of life")