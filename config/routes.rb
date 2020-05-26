Rails.application.routes.draw do

  root 'bookmarks#top'

  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  
  get 'search/search'
  get '/search' => 'search#search'

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


  resources :bookmarks do
    resource :favorites, only: [:create, :destroy]
    resource :bookmark_comments, only: [:index, :edit, :destroy, :update, :create ]
    resource :genres, only: [:create, :update, :destroy]
    collection {post :import}
  end

  resources :relationships, only: [:create, :destroy]

  get 'followed/:id' => 'relationships#followed', as: 'followed'
  get 'follower/:id' => 'relationships#follower', as: 'follower'

  resources :folders, only: [:show, :edit, :create, :destroy, :update]
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
