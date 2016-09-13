Rails.application.routes.draw do
  scope module: :api , defaults: {format: 'json'} do
    scope module: :v1, path: :v1 do
      resources :articles, only: :show
      resources :owners, only: :index 
      get ':owner_name/articles', to: 'owners#articles'
      get ':owner_name', to: 'owners#show'
     
    end
  end
end
