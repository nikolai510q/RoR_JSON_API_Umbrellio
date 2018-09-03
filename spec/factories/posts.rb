FactoryBot.define do
  factory :post do
    user
    header { "HEADER" }
    body { "BODY" }
    author_ip { '127.0.0.1' }

    factory :post_with_rating do
      after(:create) do |post|
        create_list(:rating, 5, post_id: post.id, value: Random.new.rand(1..5))
      end
    end
  end
end
