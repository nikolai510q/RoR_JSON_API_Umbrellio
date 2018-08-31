class PostSerializer
  def initialize(post)
    @post = post
  end

  def serialize
    {
      id: @post.id,
      header: @post.header,
      body: @post.body,
      author_ip: @post.author_ip.to_s
    }
  end

  def average_rating
    {
     id: @post.id,
     average_rating: @post.average_rating
    }
  end

end
