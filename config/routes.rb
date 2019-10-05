Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:customer_id/invoices', to: 'invoices#index'
        get '/:customer_id/transactions', to: 'transactions#index'
      end
      namespace :items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:item_id/invoice_items', to: 'invoice_items#index'
        get '/:item_id/merchant', to: 'merchants#show'
      end
      namespace :invoice_items do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:invoice_item_id/invoice', to: 'invoices#show'
        get '/:invoice_item_id/item', to: 'items#show'
      end
      namespace :transactions do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:transaction_id/invoice', to: 'invoices#show'
      end
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/:merchant_id/items', to: 'items#index'
        get '/:merchant_id/invoices', to: 'invoices#index'
        get '/most_revenue', to: 'most_revenue#index'
      end
      namespace :invoices do
        get '/:invoice_id/transactions', to: 'transactions#index'
        get '/:invoice_id/invoice_items', to: 'invoice_items#index'
        get '/:invoice_id/items', to: 'items#index'
        get '/:invoice_id/merchant', to: 'merchants#show'
        get '/:invoice_id/customer', to: 'customers#show'
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        # get '/:transaction_id/invoices', to: 'invoices#index'
      end
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
