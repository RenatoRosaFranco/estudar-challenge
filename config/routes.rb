# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  
  # Application
  root to: 'home#index'
  post 'persons' => 'persons#create', as: :people

  # Sidekiq
  mount Sidekiq::Web => '/sidekiq'
end
