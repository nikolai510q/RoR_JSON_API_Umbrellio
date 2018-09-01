Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :posts, only: [:index, :create]
        resources :ratings, only: [:create]
      end
    end
  end
end
