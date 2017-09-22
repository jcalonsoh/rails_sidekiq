# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'api' do
    # namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :emails
    # end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
