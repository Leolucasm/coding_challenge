Rails.application.routes.draw do
  get 'home/index'
  get 'home/find_actors_movie' => 'home#find_actors_movie'
  get 'application/language/:language' => 'application#alter_language', :as => 'alter_language'

  root 'home#index'
end
