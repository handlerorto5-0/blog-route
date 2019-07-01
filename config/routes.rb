Rails.application.routes.draw do
  resources :posts

  # to render posts by date any to localhost:3000/2010/10/01(month and day not necessarily)
  # put year,month,day to params array, it can read out parameters from the URL
  # constraints define the content of the URL
  get ':year(/:month(/:day))', to: 'posts#index', 
  constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }

end
