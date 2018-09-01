class TopRatedPosts
  def initialize(count)
    @count = count
  end

  def call
    PostsQuery.new.top_rated(@count)
      .select('id, header, body')
      .as_json
  end
end
