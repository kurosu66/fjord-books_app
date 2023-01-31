Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :books
  resources :users, only: %i(index show edit update)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "books#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
