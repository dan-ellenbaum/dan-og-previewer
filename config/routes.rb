# frozen_string_literal: true

Rails.application.routes.draw do
  resources :og_previewers, only: %i[index show new create destroy] do
    get 'progress' => 'og_previewers#progress'
  end

  root to: 'og_previewers#new'
end
