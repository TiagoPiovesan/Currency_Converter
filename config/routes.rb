Rails.application.routes.draw do

  resources :companies
  # Rotas site
  namespace :site do
    get 'home/index'
  end

  # rota para as linhas do tempo Comrpas-Vendas 
  get 'report/report_sell'
  get 'report/report_buy'

  resources :sells
  resources :buys
  resources :customers
  resources :currencies, only: [:show, :destroy, :index]

  # rota para criação dos reltórios
  get '/buy_export' => 'buys#export'
  get '/sell_export' => 'sells#export'

  # rota do botão de atualização
  post 'atualizar' => 'currencies#atualizar', as: :atualizar

  # skip serve para pular a faze de registração do usuário, cadastro só poderão ser feitos dentro do sistema
  devise_for :users, :skip => [:registrations]
  
  namespace :backoffice do
    root 'dashboard#index'
    get 'dashboard' => 'dashboard#index'
    resources :users
    resources :companies
  end

  root 'site/home#index'

end