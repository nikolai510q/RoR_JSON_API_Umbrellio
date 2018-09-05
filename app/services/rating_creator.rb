class RatingCreator
  def self.create_rating(params)
    new(params).call
  end

  def initialize(params)
    @post_id = params[:post_id]
    @value = params[:value]
  end

  def call
    Rating.create(post_id: @post_id,
                  value: @value.to_f)
    post = Post.find(@post_id)
    if (post.avr_rating == 0.0)
      post.avr_rating = @value.to_f
    else
      post.avr_rating = (post.avr_rating.to_f + @value.to_f)/2
    end
    post.save
  end
end
