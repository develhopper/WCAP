# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                   Controller#Action
#                         update_rectangle POST   /rectangle/:id(.:format)                                                                      rectangles#update
#                           update_balloon POST   /balloon/:id(.:format)                                                                        balloons#update
#                       study_test_details GET    /studies/:study_id/test_details(.:format)                                                     test_details#index
#                                          POST   /studies/:study_id/test_details(.:format)                                                     test_details#create
#                    new_study_test_detail GET    /studies/:study_id/test_details/new(.:format)                                                 test_details#new
#                   edit_study_test_detail GET    /studies/:study_id/test_details/:id/edit(.:format)                                            test_details#edit
#                        study_test_detail GET    /studies/:study_id/test_details/:id(.:format)                                                 test_details#show
#                                          PATCH  /studies/:study_id/test_details/:id(.:format)                                                 test_details#update
#                                          PUT    /studies/:study_id/test_details/:id(.:format)                                                 test_details#update
#                                          DELETE /studies/:study_id/test_details/:id(.:format)                                                 test_details#destroy
#                       add_examiner_study POST   /studies/:id/add_examiner(.:format)                                                           studies#add_examiner
#                    remove_examiner_study DELETE /studies/:id/remove_examiner(.:format)                                                        studies#remove_examiner
#                      get_examiners_study GET    /studies/:id/get_examiners(.:format)                                                          studies#get_examiners
#                           finalize_study POST   /studies/:id/finalize(.:format)                                                               studies#finalize
#                        add_patient_study POST   /studies/:id/add_patient(.:format)                                                            studies#add_patient
#                       get_patients_study GET    /studies/:id/get_patients(.:format)                                                           studies#get_patients
#                  get_ddt_questions_study GET    /studies/:id/get_ddt_questions(.:format)                                                      studies#get_ddt_questions
#                   add_ddt_question_study POST   /studies/:id/add_ddt_question(.:format)                                                       studies#add_ddt_question
#                remove_ddt_question_study DELETE /studies/:id/remove_ddt_question(.:format)                                                    studies#remove_ddt_question
#                                  studies GET    /studies(.:format)                                                                            studies#index
#                                          POST   /studies(.:format)                                                                            studies#create
#                                new_study GET    /studies/new(.:format)                                                                        studies#new
#                               edit_study GET    /studies/:id/edit(.:format)                                                                   studies#edit
#                                    study GET    /studies/:id(.:format)                                                                        studies#show
#                                          PATCH  /studies/:id(.:format)                                                                        studies#update
#                                          PUT    /studies/:id(.:format)                                                                        studies#update
#                                          DELETE /studies/:id(.:format)                                                                        studies#destroy
#                            ddt_questions GET    /ddt_questions(.:format)                                                                      ddt_questions#index
#                                          POST   /ddt_questions(.:format)                                                                      ddt_questions#create
#                         new_ddt_question GET    /ddt_questions/new(.:format)                                                                  ddt_questions#new
#                        edit_ddt_question GET    /ddt_questions/:id/edit(.:format)                                                             ddt_questions#edit
#                             ddt_question GET    /ddt_questions/:id(.:format)                                                                  ddt_questions#show
#                                          PATCH  /ddt_questions/:id(.:format)                                                                  ddt_questions#update
#                                          PUT    /ddt_questions/:id(.:format)                                                                  ddt_questions#update
#                                          DELETE /ddt_questions/:id(.:format)                                                                  ddt_questions#destroy
#                              restart_ddt POST   /ddts/:id/restart(.:format)                                                                   ddts#restart
#                                     ddts GET    /ddts(.:format)                                                                               ddts#index
#                                 edit_ddt GET    /ddts/:id/edit(.:format)                                                                      ddts#edit
#                                      ddt GET    /ddts/:id(.:format)                                                                           ddts#show
#                                          PATCH  /ddts/:id(.:format)                                                                           ddts#update
#                                          PUT    /ddts/:id(.:format)                                                                           ddts#update
#                           restart_gonogo POST   /gonogos/:id/restart(.:format)                                                                gonogos#restart
#                            finish_gonogo POST   /gonogos/:id/finish(.:format)                                                                 gonogos#finish
#                                  gonogos GET    /gonogos(.:format)                                                                            gonogos#index
#                              edit_gonogo GET    /gonogos/:id/edit(.:format)                                                                   gonogos#edit
#                                   gonogo GET    /gonogos/:id(.:format)                                                                        gonogos#show
#                                          PATCH  /gonogos/:id(.:format)                                                                        gonogos#update
#                                          PUT    /gonogos/:id(.:format)                                                                        gonogos#update
#                           restart_stroop POST   /stroops/:id/restart(.:format)                                                                stroops#restart
#                                  stroops GET    /stroops(.:format)                                                                            stroops#index
#                              edit_stroop GET    /stroops/:id/edit(.:format)                                                                   stroops#edit
#                                   stroop GET    /stroops/:id(.:format)                                                                        stroops#show
#                                          PATCH  /stroops/:id(.:format)                                                                        stroops#update
#                                          PUT    /stroops/:id(.:format)                                                                        stroops#update
#                              finish_bart POST   /barts/:id/finish(.:format)                                                                   barts#finish
#                             restart_bart POST   /barts/:id/restart(.:format)                                                                  barts#restart
#                                    barts GET    /barts(.:format)                                                                              barts#index
#                                edit_bart GET    /barts/:id/edit(.:format)                                                                     barts#edit
#                                     bart GET    /barts/:id(.:format)                                                                          barts#show
#                                          PATCH  /barts/:id(.:format)                                                                          barts#update
#                                          PUT    /barts/:id(.:format)                                                                          barts#update
#                         set_current_task POST   /tasks/:id/set_current(.:format)                                                              tasks#set_current
#                                    tasks GET    /tasks(.:format)                                                                              tasks#index
#                                     task GET    /tasks/:id(.:format)                                                                          tasks#show
#                      add_examiner_clinic POST   /clinics/:id/add_examiner(.:format)                                                           clinics#add_examiner
#                   remove_examiner_clinic DELETE /clinics/:id/remove_examiner(.:format)                                                        clinics#remove_examiner
#                     get_examiners_clinic GET    /clinics/:id/get_examiners(.:format)                                                          clinics#get_examiners
#                                  clinics GET    /clinics(.:format)                                                                            clinics#index
#                                          POST   /clinics(.:format)                                                                            clinics#create
#                               new_clinic GET    /clinics/new(.:format)                                                                        clinics#new
#                              edit_clinic GET    /clinics/:id/edit(.:format)                                                                   clinics#edit
#                                   clinic GET    /clinics/:id(.:format)                                                                        clinics#show
#                                          PATCH  /clinics/:id(.:format)                                                                        clinics#update
#                                          PUT    /clinics/:id(.:format)                                                                        clinics#update
#                                          DELETE /clinics/:id(.:format)                                                                        clinics#destroy
#         patient_abusing_profile_abusings GET    /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings(.:format)                 abusings#index
#                                          POST   /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings(.:format)                 abusings#create
#      new_patient_abusing_profile_abusing GET    /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/new(.:format)             abusings#new
#     edit_patient_abusing_profile_abusing GET    /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/:id/edit(.:format)        abusings#edit
#          patient_abusing_profile_abusing GET    /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/:id(.:format)             abusings#show
#                                          PATCH  /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/:id(.:format)             abusings#update
#                                          PUT    /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/:id(.:format)             abusings#update
#                                          DELETE /patients/:patient_id/abusing_profiles/:abusing_profile_id/abusings/:id(.:format)             abusings#destroy
#                 patient_abusing_profiles GET    /patients/:patient_id/abusing_profiles(.:format)                                              abusing_profiles#index
#                                          POST   /patients/:patient_id/abusing_profiles(.:format)                                              abusing_profiles#create
#              new_patient_abusing_profile GET    /patients/:patient_id/abusing_profiles/new(.:format)                                          abusing_profiles#new
#             edit_patient_abusing_profile GET    /patients/:patient_id/abusing_profiles/:id/edit(.:format)                                     abusing_profiles#edit
#                  patient_abusing_profile GET    /patients/:patient_id/abusing_profiles/:id(.:format)                                          abusing_profiles#show
#                                          PATCH  /patients/:patient_id/abusing_profiles/:id(.:format)                                          abusing_profiles#update
#                                          PUT    /patients/:patient_id/abusing_profiles/:id(.:format)                                          abusing_profiles#update
#                                          DELETE /patients/:patient_id/abusing_profiles/:id(.:format)                                          abusing_profiles#destroy
#               patient_basic_demographics GET    /patients/:patient_id/basic_demographics(.:format)                                            basic_demographics#index
#                                          POST   /patients/:patient_id/basic_demographics(.:format)                                            basic_demographics#create
#            new_patient_basic_demographic GET    /patients/:patient_id/basic_demographics/new(.:format)                                        basic_demographics#new
#           edit_patient_basic_demographic GET    /patients/:patient_id/basic_demographics/:id/edit(.:format)                                   basic_demographics#edit
#                patient_basic_demographic GET    /patients/:patient_id/basic_demographics/:id(.:format)                                        basic_demographics#show
#                                          PATCH  /patients/:patient_id/basic_demographics/:id(.:format)                                        basic_demographics#update
#                                          PUT    /patients/:patient_id/basic_demographics/:id(.:format)                                        basic_demographics#update
#                                          DELETE /patients/:patient_id/basic_demographics/:id(.:format)                                        basic_demographics#destroy
#     patient_treatment_history_treatments GET    /patients/:patient_id/treatment_histories/:treatment_history_id/treatments(.:format)          treatments#index
#                                          POST   /patients/:patient_id/treatment_histories/:treatment_history_id/treatments(.:format)          treatments#create
#  new_patient_treatment_history_treatment GET    /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/new(.:format)      treatments#new
# edit_patient_treatment_history_treatment GET    /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/:id/edit(.:format) treatments#edit
#      patient_treatment_history_treatment GET    /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/:id(.:format)      treatments#show
#                                          PATCH  /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/:id(.:format)      treatments#update
#                                          PUT    /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/:id(.:format)      treatments#update
#                                          DELETE /patients/:patient_id/treatment_histories/:treatment_history_id/treatments/:id(.:format)      treatments#destroy
#              patient_treatment_histories GET    /patients/:patient_id/treatment_histories(.:format)                                           treatment_histories#index
#                                          POST   /patients/:patient_id/treatment_histories(.:format)                                           treatment_histories#create
#            new_patient_treatment_history GET    /patients/:patient_id/treatment_histories/new(.:format)                                       treatment_histories#new
#           edit_patient_treatment_history GET    /patients/:patient_id/treatment_histories/:id/edit(.:format)                                  treatment_histories#edit
#                patient_treatment_history GET    /patients/:patient_id/treatment_histories/:id(.:format)                                       treatment_histories#show
#                                          PATCH  /patients/:patient_id/treatment_histories/:id(.:format)                                       treatment_histories#update
#                                          PUT    /patients/:patient_id/treatment_histories/:id(.:format)                                       treatment_histories#update
#                                          DELETE /patients/:patient_id/treatment_histories/:id(.:format)                                       treatment_histories#destroy
#                                 patients GET    /patients(.:format)                                                                           patients#index
#                                          POST   /patients(.:format)                                                                           patients#create
#                              new_patient GET    /patients/new(.:format)                                                                       patients#new
#                             edit_patient GET    /patients/:id/edit(.:format)                                                                  patients#edit
#                                  patient GET    /patients/:id(.:format)                                                                       patients#show
#                                          PATCH  /patients/:id(.:format)                                                                       patients#update
#                                          PUT    /patients/:id(.:format)                                                                       patients#update
#                                          DELETE /patients/:id(.:format)                                                                       patients#destroy
#                                 profiles GET    /profiles(.:format)                                                                           profiles#index
#                             edit_profile GET    /profiles/:id/edit(.:format)                                                                  profiles#edit
#                                  profile GET    /profiles/:id(.:format)                                                                       profiles#show
#                                          PATCH  /profiles/:id(.:format)                                                                       profiles#update
#                                          PUT    /profiles/:id(.:format)                                                                       profiles#update
#                    update_ddt_ddt_answer POST   /ddts/:ddt_id/ddt_answer/:id(.:format)                                                        ddt_answers#update
#                            welcome_index GET    /welcome/index(.:format)                                                                      welcome#index
#                             welcome_help GET    /welcome/help(.:format)                                                                       welcome#help
#                         new_user_session GET    /users/sign_in(.:format)                                                                      devise/sessions#new
#                             user_session POST   /users/sign_in(.:format)                                                                      devise/sessions#create
#                     destroy_user_session DELETE /users/sign_out(.:format)                                                                     devise/sessions#destroy
#                            user_password POST   /users/password(.:format)                                                                     devise/passwords#create
#                        new_user_password GET    /users/password/new(.:format)                                                                 devise/passwords#new
#                       edit_user_password GET    /users/password/edit(.:format)                                                                devise/passwords#edit
#                                          PATCH  /users/password(.:format)                                                                     devise/passwords#update
#                                          PUT    /users/password(.:format)                                                                     devise/passwords#update
#                 cancel_user_registration GET    /users/cancel(.:format)                                                                       devise/registrations#cancel
#                        user_registration POST   /users(.:format)                                                                              devise/registrations#create
#                    new_user_registration GET    /users/sign_up(.:format)                                                                      devise/registrations#new
#                   edit_user_registration GET    /users/edit(.:format)                                                                         devise/registrations#edit
#                                          PATCH  /users(.:format)                                                                              devise/registrations#update
#                                          PUT    /users(.:format)                                                                              devise/registrations#update
#                                          DELETE /users(.:format)                                                                              devise/registrations#destroy
#                             approve_user POST   /users/:id/approve(.:format)                                                                  users#approve
#                          disapprove_user DELETE /users/:id/disapprove(.:format)                                                               users#disapprove
#                                    users GET    /users(.:format)                                                                              users#index
#                                     root GET    /                                                                                             welcome#index
#

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

  resources :ddts, except: [:destroy, :new, :create] do
    member do
      post 'restart'
    end
  end


  resources :gonogos, except: [:destroy, :new, :create] do
    member do
      post 'restart'
      post 'finish'
    end
  end

  resources :stroops, except: [:destroy, :new, :create]  do
    member do
      post 'restart'
    end
  end

  resources :barts, except: [:destroy, :new, :create] do
    member do
      post 'finish'
      post 'restart'
    end
  end

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



  post 'ddts/:ddt_id/ddt_answer/:id' => 'ddt_answers#update', as: :update_ddt_ddt_answer

  # post 'studies/:id/add_examiner/:examiner_id' => 'studies#add_examiner', as: :add_study_examiner
  
  # delete 'studies/:id/remove_examiner/:examiner_id' => 'studies#remove_examiner', as: :remove_study_examiner

  get 'welcome/index'
  get 'welcome/help'

  devise_for :users
  resources :users, only: [:index] do
    member do
      post "approve"
      delete "disapprove"
    end

  end
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
