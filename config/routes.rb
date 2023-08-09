Rails.application.routes.draw do
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
  devise_for :users, controllers: {
    registrations: 'registrations/registrations'}

  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
