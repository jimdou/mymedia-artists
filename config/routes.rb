Rails.application.routes.draw do

  get '/artists/random', to: 'artists#random'
  post '/artists/random', to: 'artists#random'


  resources :artist_similarities
  resources :similar_artists
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "main#home"
end
