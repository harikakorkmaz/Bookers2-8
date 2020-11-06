Rails.application.routes.draw do


  devise_for :users, :controllers => {
    :registrations => 'users/registrations'}

  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  root 'homes#top'
  get 'home/about' => 'homes#about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
