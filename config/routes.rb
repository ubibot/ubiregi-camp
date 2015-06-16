Rails.application.routes.draw do
  resources :projects, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :accesses, only: [] do
    collection do
      post "grant", action: :grant
      post "reject", action: :reject
    end
  end

  root "welcome#index"
  get '/login' => 'welcome#login'
  get '/logout' => 'welcome#logout'
  get '/oauth2callback' => 'welcome#oauth2callback'
end
