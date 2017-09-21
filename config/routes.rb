# frozen_string_literal: true

Rails.application.routes.draw do
  resources :emails
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints subdomain: 'api' do
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
