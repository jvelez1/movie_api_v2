(1..30).map do |_|
  Movie.create(name: Faker::Movie.title,
               plot: Faker::Movie.quote)
end

(1..30).map do |_|
  episodes = (1..10).map do |index|
    {
      title: Faker::Movie.title,
      episode_number: index
    }
  end
  season = Season.create!(
    name: Faker::Movie.title,
    plot: Faker::Movie.quote,
    season_number: rand(5..9)
  )
  season.episodes.create!(episodes)
end