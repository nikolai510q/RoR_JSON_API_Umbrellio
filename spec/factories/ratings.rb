FactoryBot.define do
  factory :rating do
    post
    value { rand(1..5) }
  end
end
