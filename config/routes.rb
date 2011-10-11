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

    devise_for :users

    resources :vendors

    match 'dashboard', :to => 'dashboard#index', :as => :dashboard
  end

  root :to => "frontpage#index"
end
