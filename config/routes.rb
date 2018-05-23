Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources:users
  resources:microposts
  root "users#index"
  root "microposts#index"
end
