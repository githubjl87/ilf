# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'open-uri' included in rail
# require 'json' included in rail

puts 'start'
Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
results = URI.open(url).read
data = JSON.parse(results)

data['results'].each do |movie_data|
  Movie.create!(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie_data['poster_path']}",
    rating: movie_data['vote_average']
  )
end

puts 'end'
