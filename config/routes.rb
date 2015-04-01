Rails.application.routes.draw do

  root 'parse#index'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :parse

end
