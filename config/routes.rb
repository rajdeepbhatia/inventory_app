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

  resources :items do
    member do
      put :change_allotment_status
      get :allotment_options
    end
    resources :attachments
    resources :allotment_histories
  end

  resources :people do
    member do
      get :items
    end
  end

  resources :users, only: :show
end
