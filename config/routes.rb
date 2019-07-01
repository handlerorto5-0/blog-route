Rails.application.routes.draw do
  resources :posts

  # to render posts by date any to localhost:3000/2010/10/01, moth and day not necessarily
  get ':year(/:month(/:day))', to: 'posts#index'

end
