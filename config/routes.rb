Rails.application.routes.draw do

  get  'sessions/new'
  get  'sessions/logout'
  post 'sessions/login'

  get  'users/create'    => 'sessions#new'
  post 'users/create'    => 'users#create'

  get  'lists/:id/show'  => 'lists#show'
  post 'lists/:id/add'   => 'lists#add'

  get  'songs'           => 'songs#index'
  get  'songs/:id/show/' => 'songs#show'
  post 'songs/add'       => 'songs#add'

  root 'sessions#new'

end
