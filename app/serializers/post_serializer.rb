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

  def avr_rating
    {
     id: @post.id,
     avr_rating: @post.avr_rating
    }
  end

end
