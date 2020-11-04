FactoryBot.define do
  factory :season do
    name { 'Dr Hourse' }
    sequence(:season_number) { |n| n }
    plot { 'Temporada 1' }
  end
end