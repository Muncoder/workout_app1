Rails.application.routes.draw do

  devise_for :users
  root "pages#home"

  resources :users do
  	resources :exercises
  end

end
