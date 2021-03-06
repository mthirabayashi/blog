# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all;

ActiveRecord::Base.connection.reset_pk_sequence!('users')


User.create!(username: "guest", email: "guest@email.com", password: "password", profile_pic: "http://res.cloudinary.com/duep1w4tv/image/upload/v1478651158/ShareAGram/pzcgnvdxurnsefvhkr2l.png")
