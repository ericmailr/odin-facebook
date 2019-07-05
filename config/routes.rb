Rails.application.routes.draw do
  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
   
  root to: 'posts#index'
  
  patch '/update_friendship' => 'friendships#update', as: :update_friendship

  resources :friendships

  resources :posts

  resources :likes, only: [:create]

  resources :comments, only: [:create]

  resources :users, only: [:index, :show, :update]

end
