class TopRatedPosts
  def initialize(count)
    @count = count
  end

  def call
    PostsQuery.new.top_rated(@count)
  end
end
