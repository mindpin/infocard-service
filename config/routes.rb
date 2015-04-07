Rails.application.routes.draw do

  root 'parse#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :parse

  get '/api/fetch_infocard' => 'api#fetch_infocard'
end
