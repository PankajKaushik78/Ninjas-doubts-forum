Rails.application.routes.draw do
  resources :categories
  
  resources :doubts do
    resources :comments
  end
  root 'doubts#index'
  
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
