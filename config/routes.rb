Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :users do
  	resources :exercises
  end

  resource :dashboard, only:[:index] do
  	collection do
  		post :search, to: 'dashboard#search'
  	end
  end
  
end
