Rails.application.routes.draw do

  # namespace :api do
  #   namespace :v1 do
  #     namespace :customers do
  #       get 'search/index'
  #     end
  #   end
  # end
  #
  # namespace :api do
  #   namespace :v1 do
  #     namespace :customers do
  #       get 'search/show'
  #     end
  #   end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :customers do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
      end
      resources :customers, only: [:index, :show]
    end
  end
end
