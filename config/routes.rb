Rails.application.routes.draw do
  get   'sessions/new'
  get   'sessions/logout'
  get   'dashboard/index'
  post  'sessions/login'

  post  'users/create'

  root  'sessions#new'

end
