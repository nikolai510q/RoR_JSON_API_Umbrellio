class PostCreator
  def self.create_post(params)
    new(params).call
  end

  def initialize(params)
    @header = params[:header]
    @body = params[:body]
    @author_ip = params[:author_ip]
    @login = params[:login]
  end

  def call
    user = User.find_or_create_by(login: @login)
    Post.create(user: user,
                header: @header,
                body: @body,
                author_ip: @author_ip)
  end
end
