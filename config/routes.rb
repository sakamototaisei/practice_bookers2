Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    resources :book_commnets, only: [:create, :destroy]
  end
end
