Rails.application.routes.draw do
  resources :steward_kpis

  root to: 'visitors#index'
end
