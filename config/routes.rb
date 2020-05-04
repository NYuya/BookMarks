Rails.application.routes.draw do

  root to: 'bookmarks#top'

  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations',
    passwords: 'customers/passwords'
  }

  namespace :customers do
    get 'confirm' => 'customers#confirm'
    patch 'hide' => 'customers#hide'
    put 'hide' => 'customers#hide'
  end

  scope module: :customers do
      resources :customers, only: [:show, :edit, :update]
  end

  get 'followed/:id' => 'relationships#followed', as: 'followed'
  get 'follower/:id' => 'relationships#follower', as: 'follower'
  resources :relationships, only: [:create, :destroy]


  resources :bookmarks do
    resource :favorites, only: [:create, :destroy]
    resource :bookmark_comments, only: [:index, :edit, :destroy, :update, :create ]
    resource :genres, only: [:create, :update, :destroy]
  end

  
  resources :folders, only: [:create,:destroy,:update]
  resources :folder_bookmarks, only: [:create,:destroy,:update]


  devise_for :admins, controllers: {
          sessions: 'admins/sessions'
        }
    namespace :admins do
        get '/' => 'admins#top'
        resources :bookmarks, only: [:show,:index,:edit, :update]
        resources :genres, only: [:index,:create, :edit, :update]
        resources :customers, only: [:show,:index,:edit, :update]
        resources :bookmark_comments, only: [:index, :show, :update, :destroy]
    end

  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
