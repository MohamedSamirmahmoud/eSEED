Rails.application.routes.draw do
  get 'employees/index'

  resources :employees do
    resources :attendances
  end

  get '/reports/:id/range', to: 'reports#range'
  post '/reports/:id/range', to: 'reports#filter'

  get 'reports/monthstar', to: 'reports#monthstar'
  post 'reports/monthstar', to: 'reports#star'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
