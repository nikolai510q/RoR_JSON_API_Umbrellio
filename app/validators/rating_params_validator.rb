class RatingParamsValidator
  def self.errors_for(params)
    new(params).errors
  end

  def initialize(params)
    @post_id = params[:post_id].try(:to_i)
    @value = params[:value].try(:to_i)
  end

  def errors
    [
      post_id_must_be_present,
      value_must_be_present,
      value_must_be_in_range
    ].compact
  end

  private

  def post_id_must_be_present
    [:post_id, :must_be_present] if @post_id.blank?
  end

  def value_must_be_present
    [:value, :must_be_present] if @value.blank?
  end

  def value_must_be_in_range
    [:value, :must_be_in_range] unless @value.in?(1..5)
  end
end
