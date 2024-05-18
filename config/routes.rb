Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :create]
      resources :messages, only: [:index, :show, :create]
      resources :groups, only: [:index, :show, :create]
      resources :group_members, only: [:index, :show, :create]
      resources :chats, only: [:index, :show, :create]
      # Session routes
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end
  end
end
