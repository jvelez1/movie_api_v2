FactoryBot.define do
  factory :episode do
    title { 'Ritos iniciáticos' }
    sequence(:episode_number) { |n| n }
  end
end