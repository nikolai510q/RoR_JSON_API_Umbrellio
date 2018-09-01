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
                  value: @value)
  end
end
