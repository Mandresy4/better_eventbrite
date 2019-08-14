Rails.application.routes.draw do


  get 'attendances/index'
  get 'attendances/show'
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/edit'
  get 'attendances/update'
  get 'attendances/destroy'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :events

  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
