class PostParamsValidator
  def self.errors_for(params)
    new(params).errors
  end

  def initialize(params)
    @header = params[:header]
    @body = params[:body]
    @login = params[:login]
  end

  def errors
    [
      header_must_be_present,
      body_must_be_present,
      login_must_be_present
    ].compact
  end

  private

  def header_must_be_present
    [:header, :must_be_present] if @header.blank?
  end

  def body_must_be_present
    [:body, :must_be_present] if @body.blank?
  end

  def login_must_be_present
    [:login, :must_be_present] if @login.blank?
  end
end
