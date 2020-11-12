# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Ingredient.destroy_all
puts "Creating ingredients ..."

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients_array = ingredients['drinks']
ingredients_array.each do |drink|
  ingredient = drink['strIngredient1']
  Ingredient.create(name: ingredient)
end

puts "Finished!"

# Ingredient.create(name: "Lemon")
# Ingredient.create(name: "Ice")
# Ingredient.create(name: "mint leaves")
# Ingredient.create(name: "Sweet Vermouth")
# Ingredient.create(name: "Tequila")
# Ingredient.create(name: "Rosemary")
# Ingredient.create(name: "Orange bitters")
