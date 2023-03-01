Rails.application.routes.draw do
  devise_for :users
  resources :notes

  authenticated :user do
    root to: "notes#index", as: :search
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
