FactoryBot.define do
  factory :movie do
    type { 'Movie' }
    name { 'Iron Man' }
    plot { 'Un robot bonito' }

    trait :star_wars do
      name { 'Star Wars' }
      plot { 'Es una serie de películas' }
    end
  end
end
