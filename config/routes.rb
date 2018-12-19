Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users, controllers: { registrations: 'registrations' }

  namespace :admin do
    resources :users
    resources :instructions do
      collection do
        patch 'add_user'
        patch 'remove_user'
      end
    end
    resources :categories
    resources :examinations
    resources :quizzes
    resources :questions do
      resources :options
    end
    resources :answers

    scope :dashboard, controller: :dashboard do
      post 'handle_instruction'
    end
    root to: 'dashboard#index'
  end

  resources :instructions
  resources :categories
  resources :examinations

  resources :quizzes

  resources :questions do
    resources :options
  end

  resources :answers

end
