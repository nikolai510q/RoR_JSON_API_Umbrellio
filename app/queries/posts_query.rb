class PostsQuery
  def initialize()
    @relation = Post.where("avr_rating >= '1.0'").order('avr_rating DESC')
  end

  def top_rated(count)
    @relation.select('id, header, body').limit(count)
  end
end


# class PostsQuery
#   def initialize(relation = Post.all)
#     @relation = relation
#   end
#
#   def top_rated(count)
#     @relation.joins("
#       INNER JOIN (
#         SELECT post_id, AVG(value) as value
#         FROM ratings GROUP BY post_id
#       ) AS average_ratings
#       ON posts.id = average_ratings.post_id
#     ").order('value DESC').limit(count)
#   end
# end
