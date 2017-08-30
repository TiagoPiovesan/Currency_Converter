Rails.application.routes.draw do
  post 'atualizar' => 'currencies#atualizar', as: :atualizar

  resources :customers
  resources :currencies, only: [:show, :destroy, :index]
  # skip serve para pular a faze de registração do usuário, cadastro só poderão ser feitos dentro do sistema
  devise_for :users, :skip => [:registrations]
  
  namespace :backoffice do
    root 'dashboard#index'
    get 'dashboard' => 'dashboard#index'
    resources :users
  end

  root 'backoffice/dashboard#index'

end