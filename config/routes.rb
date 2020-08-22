# frozen_string_literal: true

Rails.application.routes.draw do
  
  # Application
  root to: 'home#index'
  post 'persons' => 'persons#create', as: :people
end
