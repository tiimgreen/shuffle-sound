Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get '/about',   to: 'pages#about',   as: :about
  get '/help',    to: 'pages#help',    as: :help
  get '/contact', to: 'pages#contact', as: :contact

  match '/playlists/new',       to: 'playlists#new',     via: 'get',    as: :new_playlist
  match '/playlists',           to: 'playlists#index',   via: 'get',    as: :playlists
  match '/playlists/:ref',      to: 'playlists#show',    via: 'get',    as: :playlist
  match '/playlists/:ref/edit', to: 'playlists#edit',    via: 'get',    as: :edit_playlist
  match '/playlists/:ref',      to: 'playlists#update',  via: 'patch'
  match '/playlists',           to: 'playlists#create',  via: 'post',   as: :create_playlist
  match '/playlists/:ref',      to: 'playlists#destroy', via: 'delete', as: :delete_playlist
end
