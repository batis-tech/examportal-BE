Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resource :users
  resource :tests

  get 'profile/:id' =>'users#profile'
  get 'users/:id' => 'users#destroy'
  get 'delete/exam/:id' => 'tests#destroy'
  get 'exam/show/:id' => "tests#return_content"
  post 'exame/create' => 'tests#create'
  post 'exam/edit/:id' => 'tests#update'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
