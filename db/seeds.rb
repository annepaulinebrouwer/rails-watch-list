# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Cleaning database..."
Movie.destroy_all
puts "Creating movies..."

url = 'https://tmdb.lewagon.com/movie/top_rated'
html_content = URI.open(url).read
json = JSON.parse(html_content)

json["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    rating: movie["vote_average"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}"
  )
end

puts "Finished!"
