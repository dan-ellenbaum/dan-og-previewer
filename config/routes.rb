# frozen_string_literal: true

Rails.application.routes.draw do
  # TODO: Add endpoint to poll for completed job
  resources :og_previewers, only: %i[index show new create destroy]

  root to: 'og_previewers#new'
end
