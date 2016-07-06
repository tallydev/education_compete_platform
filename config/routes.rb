Rails.application.routes.draw do

  root to: "home#index"
  
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    passwords: 'user/passwords'
  }

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    password: 'players/passwords'
  }

  # 主页面
  resource :home, only: [:index]

  # 赛事公告
  resources :notifications

  # 用户信息资料
  resources :player_infos, only: [:new, :show, :create]

  # 信息大赛相关路由
  namespace :info_competition do
    resources :activities do
      resources :recruits
    end
    resources :recruits
  end

  namespace :admin do 
    root to: "home#index"
    resources :users
    resources :activities
    resources :news
    resources :bulletins
  end

end

# == Route Map
#
#                     Prefix Verb   URI Pattern                          Controller#Action
#                       root GET    /                                    home#index
#           new_user_session GET    /users/sign_in(.:format)             user/sessions#new
#               user_session POST   /users/sign_in(.:format)             user/sessions#create
#       destroy_user_session DELETE /users/sign_out(.:format)            user/sessions#destroy
#              user_password POST   /users/password(.:format)            user/passwords#create
#          new_user_password GET    /users/password/new(.:format)        user/passwords#new
#         edit_user_password GET    /users/password/edit(.:format)       user/passwords#edit
#                            PATCH  /users/password(.:format)            user/passwords#update
#                            PUT    /users/password(.:format)            user/passwords#update
#   cancel_user_registration GET    /users/cancel(.:format)              devise/registrations#cancel
#          user_registration POST   /users(.:format)                     devise/registrations#create
#      new_user_registration GET    /users/sign_up(.:format)             devise/registrations#new
#     edit_user_registration GET    /users/edit(.:format)                devise/registrations#edit
#                            PATCH  /users(.:format)                     devise/registrations#update
#                            PUT    /users(.:format)                     devise/registrations#update
#                            DELETE /users(.:format)                     devise/registrations#destroy
#         new_player_session GET    /players/sign_in(.:format)           players/sessions#new
#             player_session POST   /players/sign_in(.:format)           players/sessions#create
#     destroy_player_session DELETE /players/sign_out(.:format)          players/sessions#destroy
#            player_password POST   /players/password(.:format)          devise/passwords#create
#        new_player_password GET    /players/password/new(.:format)      devise/passwords#new
#       edit_player_password GET    /players/password/edit(.:format)     devise/passwords#edit
#                            PATCH  /players/password(.:format)          devise/passwords#update
#                            PUT    /players/password(.:format)          devise/passwords#update
# cancel_player_registration GET    /players/cancel(.:format)            devise/registrations#cancel
#        player_registration POST   /players(.:format)                   devise/registrations#create
#    new_player_registration GET    /players/sign_up(.:format)           devise/registrations#new
#   edit_player_registration GET    /players/edit(.:format)              devise/registrations#edit
#                            PATCH  /players(.:format)                   devise/registrations#update
#                            PUT    /players(.:format)                   devise/registrations#update
#                            DELETE /players(.:format)                   devise/registrations#destroy
#              notifications GET    /notifications(.:format)             notifications#index
#                            POST   /notifications(.:format)             notifications#create
#           new_notification GET    /notifications/new(.:format)         notifications#new
#          edit_notification GET    /notifications/:id/edit(.:format)    notifications#edit
#               notification GET    /notifications/:id(.:format)         notifications#show
#                            PATCH  /notifications/:id(.:format)         notifications#update
#                            PUT    /notifications/:id(.:format)         notifications#update
#                            DELETE /notifications/:id(.:format)         notifications#destroy
#               player_infos POST   /player_infos(.:format)              player_infos#create
#            new_player_info GET    /player_infos/new(.:format)          player_infos#new
#                player_info GET    /player_infos/:id(.:format)          player_infos#show
#                 admin_root GET    /admin(.:format)                     admin/home#index
#                admin_users GET    /admin/users(.:format)               admin/users#index
#                            POST   /admin/users(.:format)               admin/users#create
#             new_admin_user GET    /admin/users/new(.:format)           admin/users#new
#            edit_admin_user GET    /admin/users/:id/edit(.:format)      admin/users#edit
#                 admin_user GET    /admin/users/:id(.:format)           admin/users#show
#                            PATCH  /admin/users/:id(.:format)           admin/users#update
#                            PUT    /admin/users/:id(.:format)           admin/users#update
#                            DELETE /admin/users/:id(.:format)           admin/users#destroy
#           admin_activities GET    /admin/activities(.:format)          admin/activities#index
#                            POST   /admin/activities(.:format)          admin/activities#create
#         new_admin_activity GET    /admin/activities/new(.:format)      admin/activities#new
#        edit_admin_activity GET    /admin/activities/:id/edit(.:format) admin/activities#edit
#             admin_activity GET    /admin/activities/:id(.:format)      admin/activities#show
#                            PATCH  /admin/activities/:id(.:format)      admin/activities#update
#                            PUT    /admin/activities/:id(.:format)      admin/activities#update
#                            DELETE /admin/activities/:id(.:format)      admin/activities#destroy
#           admin_news_index GET    /admin/news(.:format)                admin/news#index
#                            POST   /admin/news(.:format)                admin/news#create
#             new_admin_news GET    /admin/news/new(.:format)            admin/news#new
#            edit_admin_news GET    /admin/news/:id/edit(.:format)       admin/news#edit
#                 admin_news GET    /admin/news/:id(.:format)            admin/news#show
#                            PATCH  /admin/news/:id(.:format)            admin/news#update
#                            PUT    /admin/news/:id(.:format)            admin/news#update
#                            DELETE /admin/news/:id(.:format)            admin/news#destroy
#            admin_bulletins GET    /admin/bulletins(.:format)           admin/bulletins#index
#                            POST   /admin/bulletins(.:format)           admin/bulletins#create
#         new_admin_bulletin GET    /admin/bulletins/new(.:format)       admin/bulletins#new
#        edit_admin_bulletin GET    /admin/bulletins/:id/edit(.:format)  admin/bulletins#edit
#             admin_bulletin GET    /admin/bulletins/:id(.:format)       admin/bulletins#show
#                            PATCH  /admin/bulletins/:id(.:format)       admin/bulletins#update
#                            PUT    /admin/bulletins/:id(.:format)       admin/bulletins#update
#                            DELETE /admin/bulletins/:id(.:format)       admin/bulletins#destroy
#
