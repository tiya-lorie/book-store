Rails.application.routes.draw do
  default_url_options host: 'localhost'

  namespace :api do
    namespace :v1 do
      resources :authors, except: %i[new edit], shallow: true do
        scope module: :authors do      
          resources :books, except: %i[new edit]
        end
      end
    end
  end
end