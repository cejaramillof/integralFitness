Rails.application.routes.draw do
  resources :food_days, only: [:create, :destroy]
  resources :exercise_days, only: [:create, :destroy]
  resources :foods, only: [:create, :index, :destroy, :new]
  resources :exercises, only: [:show, :index]
  resources :plans, only: [:create, :index, :destroy, :show, :new]
  resources :guests, except: [:show]
  
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    authenticated :user do
      root 'guests#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end    
    get "users"=> "registrations#index"
    post "users/list"=> "registrations#update_post"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
