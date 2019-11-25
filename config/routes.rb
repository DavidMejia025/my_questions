# == Route Map
#
#                       Prefix Verb   URI Pattern                                                                              Controller#Action
#        api_v1_user_questions GET    /api/v1/users/:user_id/questions(.:format)                                               api/v1/users#questions
#  api_v1_user_single_question GET    /api/v1/users/:user_id/single_question(.:format)                                         api/v1/questions#single_question
# api_v1_user_question_package GET    /api/v1/users/:user_id/question_package(.:format)                                        api/v1/questions#question_package
#          api_v1_user_answers POST   /api/v1/users/:user_id/answers(.:format)                                                 api/v1/answers#create
#           api_v1_user_answer DELETE /api/v1/users/:user_id/answers/:id(.:format)                                             api/v1/answers#destroy
#                 api_v1_users GET    /api/v1/users(.:format)                                                                  api/v1/users#index
#                  api_v1_user GET    /api/v1/users/:id(.:format)                                                              api/v1/users#show
#                              PATCH  /api/v1/users/:id(.:format)                                                              api/v1/users#update
#                              PUT    /api/v1/users/:id(.:format)                                                              api/v1/users#update
#                              DELETE /api/v1/users/:id(.:format)                                                              api/v1/users#destroy
#             api_v1_questions GET    /api/v1/questions(.:format)                                                              api/v1/questions#index
#              api_v1_question DELETE /api/v1/questions/:id(.:format)                                                          api/v1/questions#destroy
#           api_v1_auth_signup POST   /api/v1/auth/signup(.:format)                                                            api/v1/auth/users#signup
#            api_v1_auth_login POST   /api/v1/auth/login(.:format)                                                             api/v1/auth/users#login
#           rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#    rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#           rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#    update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#         rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show update destroy] do
        get "questions",        to: "users#questions"
        get "single_question",  to: "questions#single_question"
        get "question_package", to: "questions#question_package"

        resources :answers, only: %i[create destroy]
      end

      resources :questions, only: %i[index destroy]

      namespace :auth do
        post "signup", to: "users#signup"
        post "login",  to: "users#login"
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
