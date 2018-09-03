require 'rails_helper'

RSpec.describe PostCreator do
  describe '.create_post' do
    let(:post_params) { { header: 'header', body: 'body', author_ip: '127.0.0.1' } }

    it 'create with login of new user and return post' do
      expect do
        expect do
          expect(PostCreator.create_post(post_params.merge(login: 'login'))).to be_a(Post)
        end.to change(User, :count).by(1)
      end.to change(Post, :count).by(1)
    end

    it 'create with login of existing user and return post' do
      user = create(:user)
      expect do
        expect do
          expect(PostCreator.create_post(post_params.merge(login: user.login))).to be_a(Post)
        end.to change(User, :count).by(0)
      end.to change(Post, :count).by(1)
    end
  end
end
