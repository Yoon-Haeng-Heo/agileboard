Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'posts#index'

  resources :projects do
    collection do
      get :mypage
    end
    member do
      get :recovery
      get :project_posts
    end
  end
  resources :posts do
    collection do
      get :search
    end
  end
  resources :comments
  resources :functions do
    member do
      get :set_state
    end
  end

end
