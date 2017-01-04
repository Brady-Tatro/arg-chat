Rails.application.routes.draw do
  devise_for :users
  resources :chat_rooms, only: [:new, :create, :show, :index]
  devise_scope :user do
    authenticated :user do
      root 'chat_rooms#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  mount ActionCable.server => '/cable'

end
