require 'rails_helper'

RSpec.describe RatingCreator do
  describe '.create_rating' do
    it 'create and return rating' do
      post = create(:post)
      expect do
        expect(RatingCreator.create_rating({ post_id: post.id, value: 5 })).to be_a(Rating)
      end.to change(Rating, :count).by(1)
    end
  end
end