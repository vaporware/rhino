Rails.application.routes.draw do

  devise_for :users

  root to: "home#index"

  get "/navbar", to: "ui_components#navbar"

end
