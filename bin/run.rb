require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
puts Pokemon.find(1, @db).name
