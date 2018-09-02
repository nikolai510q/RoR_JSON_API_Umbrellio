require 'rails_helper'

describe "Author ips API" do
  describe "GET #index" do
    before(:each) do
      create_list(:ips, :logins)
    end

    it 'return 200 with data' do
      get author_ips_url
      expect(response.status).to eq(200)
      json.each do |obj|
        expect(obj.keys).to include('ip', 'logins')
      end
    end
  end
end


# problem
