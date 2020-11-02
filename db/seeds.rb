(1..300).map do |_|
  Movie.create(name: Faker::Movie.title,
               plot: Faker::Movie.quote)
end

(1..300).map do |_|
  episodes = (1..10).map do |index|
    {
      title: Faker::Movie.title,
      episode_number: index
    }
  end
  Season.create(
    name: Faker::Movie.title,
    plot: Faker::Movie.quote,
    season_number: rand(5..9),
    episodes_attributes: episodes
  )
end