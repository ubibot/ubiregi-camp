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
end
