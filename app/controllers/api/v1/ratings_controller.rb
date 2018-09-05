module Api::V1
  class RatingsController < ApiController
    def create
      rating_errors = RatingParamsValidator.errors_for(create_params)
      if rating_errors.blank?
        post = Post.find(RatingCreator.create_rating(create_params))
        render status: 200, json: PostSerializer.new(post).avr_rating
      else
        render status: 422, json: rating_errors
      end
    end

    private

    def create_params
      params.permit(:post_id, :value)
    end
  end
end
