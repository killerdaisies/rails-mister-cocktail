# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

# Ingredient.delete_all
# puts "Deleted all ingredients"

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail = open(url).read
results = JSON.parse(cocktail)

ingredients = results["drinks"].map do |result|
  result["strIngredient1"]
end

ingredients.sort!

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

puts "created #{Ingredient.count} ingredients!"





# urls = ["http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png", "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png", "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"]
# article = Article.new(title: 'NES', body: "A great console")
# article.remote_photo_url = url
# article.save
