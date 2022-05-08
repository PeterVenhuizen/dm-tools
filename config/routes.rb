# frozen_string_literal: true

Rails.application.routes.draw do
  root 'monsters#index'

  resources :monsters
end
