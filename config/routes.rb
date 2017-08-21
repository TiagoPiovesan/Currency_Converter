Rails.application.routes.draw do

  # skip serve para pular a faze de registração do usuário, cadastro só poderão ser feitos dentro do sistema
  devise_for :users, :skip => [:registrations]
  
  namespace :backoffice do
    root 'dashboard#index'
    get 'dashboard' => 'dashboard#index'
    resources :users, except: [:show]
  end

  root 'backoffice/dashboard#index'

end