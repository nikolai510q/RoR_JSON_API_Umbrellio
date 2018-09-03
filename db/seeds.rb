NUMBERS_OF_USERS  = 100
NUMBERS_OF_IPS    = 50
NUMBERS_OF_POSTS  = 200000
CHANCE_GET_RATING_FOR_POST = 40 # in percentages
MAX_NUMBERS_OF_RATING_FOR_POST = 10

logins = []
NUMBERS_OF_USERS.times do |t|
<<<<<<< HEAD
  logins << Faker::Internet.unique.user_name
=======
  logins << Faker::Internet.user_name
>>>>>>> feature_branch
end

author_ips = []
NUMBERS_OF_IPS.times do |t|
<<<<<<< HEAD
  author_ips << Faker::Internet.unique.ip_v4_address
=======
  author_ips << Faker::Internet.ip_v4_address
>>>>>>> feature_branch
end

NUMBERS_OF_POSTS.times do |t|
  if t % (NUMBERS_OF_POSTS/10) == 0
    puts "#{(t.to_f/NUMBERS_OF_POSTS*100).to_i}\% OF SEEDS"
  end
  post_params = {
    login: logins.sample,
    author_ip: author_ips.sample,
    header: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  }
  post = PostCreator.create_post(post_params)
  if Random.new.rand(1..100) < CHANCE_GET_RATING_FOR_POST
    Random.new.rand(1..MAX_NUMBERS_OF_RATING_FOR_POST).times do |t|
      rating_params = { post_id: post.id, value: Random.new.rand(1..5) }
      RatingCreator.create_rating(rating_params)
    end
  end
end
