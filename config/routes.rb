Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/register' => 'devise/registrations#new'

    authenticated :user do
      root 'items#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :items
  resources :people
  resources :allotment_histories
end
