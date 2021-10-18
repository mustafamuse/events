# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events, only: [:create]
  get '/todaystats', to: 'todaystats#index'
end