# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

games = [
  {
    title: 'Minecraft',
    year: '2011',
    cover: 'https://upload.wikimedia.org/wikinews/en/7/7a/Minecraft_game_cover.jpeg'
  },
  {
    title: 'GTA V',
    year: '2013',
    cover: 'https://i.pinimg.com/originals/9a/77/db/9a77db0d3793bb8c4170658776d948c8.jpg'
  },
  {
    title: "PUBG",
    year: '2017',
    cover: 'https://d2n9ha3hrkss16.cloudfront.net/uploads/stage/stage_image/61995/optimized_large_thumb_stage.jpg'
  },
  {
    title: 'Rocket League',
    year: '2015',
    cover: 'https://upload.wikimedia.org/wikipedia/commons/e/e0/Rocket_League_coverart.jpg'
  },
  {
    title: 'CoD: Modern Warfare',
    year: '2019',
    cover: 'https://cdn-products.eneba.com/resized-products/4FTGL0Ta9wnP4dqoBDEEE91a45upnnRDxUHIpKNwvIA_350x200_1x-0.jpeg'
  },
  {
    title: 'Overwatch',
    year: '2016',
    cover: 'https://cdn-products.eneba.com/resized-products/X1Jk2NuMWbQeBZag6_jsUOtTaN0NnMjcoBEQ45tM9iY_350x200_1x-0.jpeg'
  },
  {
    title: 'League of Legends',
    year: '2009',
    cover: 'https://lh3.googleusercontent.com/WebglHOYlW-2P7ADP9oUSSrgy12PHyAE6GP_jmJkQOZZ1XH7Pa_7216EK2qS7iJFvncqOaDjg40BrYdzPbB9qNwn'
  },
  {
    title: 'DOTA 2',
    year: '2011',
    cover: 'https://cdn.cloudflare.steamstatic.com/apps/dota2/images/dota2_social.jpg'
  }
]

games.each do |game|
  Game.create(title: game[:title], year: game[:year], cover: game[:cover])
end