require 'rails_helper'

RSpec.describe TopRatedPosts do
  describe '#call' do
    it 'find and return array with top rated posts' do
      create_list(:post_with_rating, 5)
      posts = TopRatedPosts.new(3).call
      expect(posts.size).to eq(3)
      expect(posts[0].keys).to eq(['id', 'header', 'body'])
    end

    it 'try take more posts than exist' do
      create_list(:post_with_rating, 3)
      posts = TopRatedPosts.new(10).call
      expect(posts.size).to eq(3)
    end

    it '0 posts in db' do
      posts = TopRatedPosts.new(3).call
      expect(posts).to be_empty
    end
  end
end