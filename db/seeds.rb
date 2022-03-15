# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create some monsters
animated_books = Monster.create({
  name: 'Swarm of Animated Books',
  size: 'Medium',
  species: 'Construct',
  alignment: 'unaligned',
  armor_class: '12 (natural armor)',
  hit_points: 22,
  hit_dice: '4d8 + 4',
  speed: {"fly"=>"30", "swim"=>"0", "walk"=>"0", "climb"=>"0", "burrow"=>"0"},
  ability_scores: {"constitution"=>"12", "intelligence"=>"1", "wisdom"=>"10", "charisma"=>"1", "strength"=>"10", "dexterity"=>"13"},
  languages: '',
  challenge_rating: '1/4',
  xp: 50,
  proficiency_bonus: 2
})

broom = Monster.create({
  name: 'Animated Broom',
  size: 'Small',
  species: 'Construct',
  alignment: 'unaligned',
  armor_class: '15 (natural armor)',
  hit_points: 17,
  hit_dice: '5d6',
  speed: {"fly"=>"50", "swim"=>"0", "walk"=>"0", "climb"=>"0", "burrow"=>"0"},
  ability_scores: {"strength"=>"10", "dexterity"=>"17", "constitution"=>"10", "intelligence"=>"1", "wisdom"=>"5", "charisma"=>"1"},
  languages: '',
  challenge_rating: '1/4',
  xp: 50,
  proficiency_bonus: 2
})

chained_library = Monster.create({
  name: 'Animated Chained Library',
  size: 'Large',
  species: 'Construct',
  alignment: 'unaligned',
  armor_class: '14 (natural armor)',
  hit_points: 45,
  hit_dice: '6d10 + 12',
  speed: {"fly"=>"0", "swim"=>"0", "walk"=>"10", "climb"=>"0", "burrow"=>"0"},
  ability_scores: {"strength"=>"15", "dexterity"=>"8", "constitution"=>"14", "intelligence"=>"1", "wisdom"=>"5", "charisma"=>"1"},
  languages: '',
  challenge_rating: '1',
  xp: 200,
  proficiency_bonus: 2
})