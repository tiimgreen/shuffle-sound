Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/about',   to: 'pages#about',   as: :about
  get '/help',    to: 'pages#help',    as: :help
  get '/contact', to: 'pages#contact', as: :contact
end
