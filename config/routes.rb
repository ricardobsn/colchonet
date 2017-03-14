Rails.application.routes.draw do
#  scope ":locale", locale: /en|pt\-BR/ do
  resources :rooms
  resources :users

  root 'home#index'
#end
end
