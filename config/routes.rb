Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects

  namespace 'api' do
    namespace 'v1' do
      resources :projects
    end
  end
end
