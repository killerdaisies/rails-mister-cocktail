Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :new, :create, :show, :destroy, :edit, :update ] do
    resources :ingredients
    resources :doses, except: [:destroy]
  end

  resources :doses, only: [:destroy]
  root to: 'cocktails#index'
end
