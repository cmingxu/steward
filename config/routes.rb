Rails.application.routes.draw do
  resources :steward_page_widgets
  resources :steward_kpis
  resource :nav_tree, only: [:show]

  root to: 'visitors#index'
end
