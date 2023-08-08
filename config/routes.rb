Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
  devise_for :users, controllers: {
    registrations: 'registrations/registrations',
    sessions: 'users/sessions'
  }

  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :entities, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end
