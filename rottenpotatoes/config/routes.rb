Rottenpotatoes::Application.routes.draw do
  resources :movies
  # map '/' to be a redirect to '/movies'
  
  get 'movies/:id/simliar_movies' => 'movies#similar_movies', :as => :similar_movies
  root :to => redirect('/movies')
end
