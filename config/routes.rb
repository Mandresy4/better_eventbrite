Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :events do
  resources :attendances
  end

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
