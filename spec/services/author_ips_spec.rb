require 'rails_helper'

RSpec.describe AuthorIps do
  describe '#call' do
    it 'find and return ips with authors' do
      create_list(:post, 5, author_ip: '1.1.1.1')
      create_list(:post, 5, author_ip: '1.1.1.2')
      create_list(:post, 1, author_ip: '1.1.1.3') # should not be found, only 1 author
      ips = AuthorIps.new.call
      expect(ips.size).to eq(2)
      expect(ips[0]['ip']).to eq('1.1.1.1/32')
      expect(ips[1]['ip']).to eq('1.1.1.2/32')
    end
  end
end