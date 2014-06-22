Rails.application.routes.draw do
  root to: 'pages#home'

  get '/about',   to: 'pages#about',   as: :about
  get '/help',    to: 'pages#help',    as: :help
  get '/contact', to: 'pages#contact', as: :contact
end
