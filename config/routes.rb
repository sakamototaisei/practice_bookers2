Rails.application.routes.draw do
  get 'searches/search'
  devise_for :users
  # ゲストログイン
  post 'users/guest_sign_in', to: 'users#new_guest'

  root to: 'homes#top'

  get 'home/about' => 'homes#about'
  get '/search' => 'searches#search'
  get 'search_book' => 'books#search_book'
  
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :groups do
    get "join" => "groups#join"
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
    delete "all_destroy" => "groups#all_destroy"
  end
 end
