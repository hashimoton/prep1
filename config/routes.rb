Rails.application.routes.draw do

  get 'api/users' => 'users#index'

end
