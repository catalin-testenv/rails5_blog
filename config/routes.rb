Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :admin do
    root to: 'home#home'
    resources :pages do
      collection do
        post 'bulk_update'
        delete 'bulk_destroy'
      end
    end
    resources :layout_regions
    resources :page_categories, only: [:index, :create, :update, :destroy]
    resources :tags, only: [:index, :create, :update, :destroy]
    resources :settings, only: [:index] do
      collection do
        post 'bulk_update'
      end
    end
    resources :users
    resources :comments do
      collection do
        post 'bulk_update'
        delete 'bulk_destroy'
      end
    end
  end

  resources :pages, only: [:show]
  resources :page_categories, only: [:show]
  resources :tags, only: [:show]

  root to: 'pages#root'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
