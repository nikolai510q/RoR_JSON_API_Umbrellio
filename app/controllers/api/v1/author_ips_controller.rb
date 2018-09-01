module Api::V1
  class AuthorIpsController < ApiController
    def index
      render status: 200, json: AuthorIps.new.call
    end
  end
end
