require 'rails_helper'

describe "Ratings API" do
  describe "POST #create" do
    let(:post_object) { create(:rating) }

    it 'with valid params' do
     [:post_id, :value].each do |param|
      post v1_ratings_url, params: { post_id: post_object.post_id, value: 5 }
      expect(response.status).to eq(200)
      expect(json.keys).to include('id', 'average_rating')
      expect(json['id']).to eq(post_object.post_id)
    end
  end

    it 'with invalid params' do
      [:post_id, :value].each do |param|
        post v1_ratings_url, params: { post_id: post_object.id, value: 6 }.except(param)
        expect(response.status).to eq(422)
      end
    end
  end
end
