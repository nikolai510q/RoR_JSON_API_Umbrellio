class Post < ApplicationRecord
  belongs_to  :user
  has_many    :ratings

  def average_rating
    ratings.average(:value)
  end
end
