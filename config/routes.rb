Rails.application.routes.draw do

  get 'city', to: 'home#city', as: 'city'
  #get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
