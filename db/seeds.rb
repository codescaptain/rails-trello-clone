# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(email: 'aaaa@gmail.com', password: "12345678", password_confirmation: "12345678")
board = Board.create(user: user, name: "Test board")
3.times do |x|
  list = List.create(board: board, title: "Test list#{x}", class_list: "text-white, bg-green-500", position: x)
  3.times do |y|
    Item.create(list: list, title: "Test item#{y}", class_list: "text-white, bg-red-500")
  end
end
