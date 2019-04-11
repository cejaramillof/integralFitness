Rails.application.routes.draw do
  resources :plans
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
  resources :guests, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
