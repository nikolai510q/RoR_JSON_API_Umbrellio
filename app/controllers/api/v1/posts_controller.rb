module Api::V1
  class PostsController < ApiController
    def index
      render status: 200, json: TopRatedPosts.new(params[:count].to_i).call
    end

    def create
      post_errors = PostParamsValidator.errors_for(create_params)
      if post_errors.blank?
        post = PostCreator.create_post(create_params)
        render status: 200, json: PostSerializer.new(post).serialize
      else
        render status: 422, json: post_errors
      end
    end

    private

    def create_params
      res = params.permit(:header, :body, :login)
      res.merge(author_ip: request.remote_ip)
    end
  end
end
