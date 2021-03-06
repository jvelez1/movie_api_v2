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

User.create(
  [
    {
      full_name: 'admin',
      email: 'admin@test.com',
      password: '12345678',
      password_confirmation: '12345678'
    },
    {
      full_name: 'Erick Mendoza',
      email: 'erick@correo.com',
      password: '12345678',
      password_confirmation: '12345678'
    },
    {
      full_name: 'Fabiola Borquez',
      email: 'fabi@correo.com',
      password: '12345678',
      password_confirmation: '12345678'
    },
    {
      full_name: 'Eduardo Arenas',
      email: 'eduardo@correo.com',
      password: '12345678',
      password_confirmation: '12345678'
    }
  ]
)

Purchase.create(
  [
    {
      user_id: User.first.id,
      video_footage_id: Season.first.id,
      expiry_date: DateTime.current + 1.day,
      price: 2.5,
      video_quality: 'HD'
    },
    {
      user_id: User.first.id,
      video_footage_id: Movie.first.id,
      expiry_date: DateTime.current + 1.day,
      price: 2.5,
      video_quality: 'SD'
    }
  ]
)