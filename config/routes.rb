Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'

  resources :projects do
    collection do
      get :mypage
    end
    member do
      get :recovery
      get :project_posts
    end
  end
  resources :posts
end
