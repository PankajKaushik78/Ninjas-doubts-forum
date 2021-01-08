Rails.application.routes.draw do
  root 'doubts#index'
 
  resources :doubts
  
  devise_for :users, controllers: { registrations: 'registrations' }
end
