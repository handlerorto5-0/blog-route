Rails.application.routes.draw do
  resources :posts

  #reditect to invdlid URL
  get ':year/:month/:day', to: redirect("/%{year}/0%{month}/0%{day}"),
  constraints: { year: /\d{4}/, month: /\d{1}/, day: /\d{1}/ }
  get ':year/:month/:day', to: redirect("/%{year}/0%{month}/%{day}"),
  constraints: { year: /\d{4}/, month: /\d{1}/, day: /\d{2}/ }
  get ':year/:month/:day', to: redirect("/%{year}/%{month}/0%{day}"),
  constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{1}/ }
  get ':year/:month', to: redirect("/%{year}/0%{month}"),
  constraints: { year: /\d{4}/, month: /\d{1}/ }

  # to render posts by date any to localhost:3000/2010/10/01(month and day not necessarily)
  # put year,month,day to params array, it can read out parameters from the URL
  # constraints define the content of the URL
  get ':year(/:month(/:day))', to: 'posts#index', 
  constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ }

end
