Spargris::Application.routes.draw do
  localized(I18n.available_locales) do
    resources :budget_posts

    resources :budgets do
      resources :budget_items
    end

    resources :tags, :except => [:new, :create]

    resources :transactions do
      resources :transaction_items
    end

    resources :vendors

    get 'user', :to => 'users#show', :as => :user
    put 'user', :to => 'users#update', :as => :update_user
    get 'user/edit', :to => 'users#edit', :as => :edit_user
    devise_for :users

    match 'dashboard', :to => 'dashboard#index', :as => :dashboard
  end

  root :to => "frontpage#index"
end
