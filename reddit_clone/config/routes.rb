Rails.application.routes.draw do
  get 'subs/new'

  get 'subs/create'

  get 'subs/index'

  get 'subs/update'

  get 'subs/edit'

  get 'subs/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session
end
