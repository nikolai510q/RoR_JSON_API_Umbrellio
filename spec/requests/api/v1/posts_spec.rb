require 'rails_helper'

describe "Posts API" do
  describe "GET #index" do
    before(:each) do
      create_list(:post_with_rating, 5)
    end

    it 'with count param' do
      get v1_posts_url, params: {count: 2}
      expect(response.status).to eq(200)
      expect(json.size).to eq(2)
    end

    it 'without count param' do
      get v1_posts_url
      expect(response.status).to eq(200)
      expect(json).to eq([])
    end
  end

  describe "POST #create" do
    let(:post_params) { { header: 'header', body: 'body', login: 'user' } }

    it 'with valid params' do
      post v1_posts_url, params: post_params
      expect(response.status).to eq(200)
      expect(json.keys).to include('id', 'header', 'body', 'author_ip')
      expect(json['author_ip']).to eq('127.0.0.1')
    end

    it 'with invalid params' do
      post_params.each do |k,v|
        post v1_posts_url, params: post_params.except(k)
        expect(response.status).to eq(422)
        expect(json.size).to eq(1)
      end
    end
  end
end
