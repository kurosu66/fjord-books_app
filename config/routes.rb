Rails.application.routes.draw do
  # namespace :books do
  #   get 'comment/create'
  #   get 'comment/edit'
  #   get 'comment/destroy'
  # end
  #  namespace :reports do
  #    get 'comment/create'
  #    get 'comment/edit'
  #    get 'comment/destroy'
  # end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books do
    resources :comments, module: :books, only: %i[create update destroy]
  end
  resources :reports do
    resources :comments, module: :reports, only: %i[create update destroy]
  end
  resources :users, only: %i[index show] do
    resource :relationships, only: %i[create destroy]
    scope module: :users do
      resources :followings, only: [:index]
      resources :followers, only: [:index]
    end
  end
end
