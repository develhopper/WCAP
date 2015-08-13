Rails.application.routes.draw do

  post 'rectangle/:id' => 'rectangles#update', as: :update_rectangle

  post 'balloon/:id' => 'balloons#update', as: :update_balloon

  resources :studies do
    resources :test_details
    member do
      post 'add_examiner'
      delete 'remove_examiner'
      get 'get_examiners'
      post 'finalize'
      post 'add_patient'
      get 'get_patients'
      get 'get_ddt_questions'
      post 'add_ddt_question'
      delete 'remove_ddt_question'
    end
  end

  resources :ddt_questions

  resources :ddts, except: [:destroy, :new, :create]

  resources :gonogos, except: [:destroy, :new, :create]

  resources :stroops, except: [:destroy, :new, :create]  do
    member do
      post 'restart'
    end
  end

  resources :barts, except: [:destroy, :new, :create]

  resources :tasks, except: [:destroy, :edit, :new ,:update , :create] do
    member do
      post 'set_current'
    end
  end

  resources :clinics do
    member do
      post 'add_examiner'
      delete 'remove_examiner'
      get 'get_examiners'
    end
  end

  resources :patients do
    resources :abusing_profiles do
      resources :abusings
    end
    resources :basic_demographics 
    
    resources :treatment_histories do
      resources :treatments
    end
    
  end

  resources :profiles, except: [:destroy, :new ,:create]



  # post 'ddts/:ddt_id/ddt_answer/:id' => 'ddt_answers#update', as: :update_ddt_ddt_answer

  # post 'studies/:id/add_examiner/:examiner_id' => 'studies#add_examiner', as: :add_study_examiner
  
  # delete 'studies/:id/remove_examiner/:examiner_id' => 'studies#remove_examiner', as: :remove_study_examiner

  get 'welcome/index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
