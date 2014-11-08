Rails.application.routes.draw do
  resources :steward_page_widgets

  resources :steward_kpis

  root to: 'visitors#index'
end
