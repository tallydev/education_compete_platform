Rails.application.routes.draw do

  root to: "home#index"
  
  devise_for :users, controllers: {
    sessions: 'user/sessions',
    passwords: 'user/passwords'
  }

  devise_for :players, controllers: {
    sessions: 'players/sessions',
    passwords: 'players/passwords',
    registrations: 'players/registrations'
  }

  # 主页面
  resource :home, only: [:index]

  # resources :center do 
  #   collection do
  #     get :info_competition
  #     get :talk_competition
  #     get :personal_info
  #   end
  # end

  namespace :center do
    resources :activities, only: [:show] do
      resources :info_competitions, only: [:show, :index]
      resources :talk_competitions, only: [:show, :index]  
    end
    resource :player_info
  end

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

  # 说课大赛相关路由
  namespace :talk_competition do
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
#                                 Prefix Verb   URI Pattern                                                           Controller#Action
#                                   root GET    /                                                                     home#index
#                       new_user_session GET    /users/sign_in(.:format)                                              user/sessions#new
#                           user_session POST   /users/sign_in(.:format)                                              user/sessions#create
#                   destroy_user_session DELETE /users/sign_out(.:format)                                             user/sessions#destroy
#                          user_password POST   /users/password(.:format)                                             user/passwords#create
#                      new_user_password GET    /users/password/new(.:format)                                         user/passwords#new
#                     edit_user_password GET    /users/password/edit(.:format)                                        user/passwords#edit
#                                        PATCH  /users/password(.:format)                                             user/passwords#update
#                                        PUT    /users/password(.:format)                                             user/passwords#update
#               cancel_user_registration GET    /users/cancel(.:format)                                               devise/registrations#cancel
#                      user_registration POST   /users(.:format)                                                      devise/registrations#create
#                  new_user_registration GET    /users/sign_up(.:format)                                              devise/registrations#new
#                 edit_user_registration GET    /users/edit(.:format)                                                 devise/registrations#edit
#                                        PATCH  /users(.:format)                                                      devise/registrations#update
#                                        PUT    /users(.:format)                                                      devise/registrations#update
#                                        DELETE /users(.:format)                                                      devise/registrations#destroy
#                     new_player_session GET    /players/sign_in(.:format)                                            players/sessions#new
#                         player_session POST   /players/sign_in(.:format)                                            players/sessions#create
#                 destroy_player_session DELETE /players/sign_out(.:format)                                           players/sessions#destroy
#                        player_password POST   /players/password(.:format)                                           players/passwords#create
#                    new_player_password GET    /players/password/new(.:format)                                       players/passwords#new
#                   edit_player_password GET    /players/password/edit(.:format)                                      players/passwords#edit
#                                        PATCH  /players/password(.:format)                                           players/passwords#update
#                                        PUT    /players/password(.:format)                                           players/passwords#update
#             cancel_player_registration GET    /players/cancel(.:format)                                             players/registrations#cancel
#                    player_registration POST   /players(.:format)                                                    players/registrations#create
#                new_player_registration GET    /players/sign_up(.:format)                                            players/registrations#new
#               edit_player_registration GET    /players/edit(.:format)                                               players/registrations#edit
#                                        PATCH  /players(.:format)                                                    players/registrations#update
#                                        PUT    /players(.:format)                                                    players/registrations#update
#                                        DELETE /players(.:format)                                                    players/registrations#destroy
#          info_competition_center_index GET    /center/info_competition(.:format)                                    center#info_competition
#          talk_competition_center_index GET    /center/talk_competition(.:format)                                    center#talk_competition
#             personal_info_center_index GET    /center/personal_info(.:format)                                       center#personal_info
#                           center_index GET    /center(.:format)                                                     center#index
#                                        POST   /center(.:format)                                                     center#create
#                             new_center GET    /center/new(.:format)                                                 center#new
#                            edit_center GET    /center/:id/edit(.:format)                                            center#edit
#                                 center GET    /center/:id(.:format)                                                 center#show
#                                        PATCH  /center/:id(.:format)                                                 center#update
#                                        PUT    /center/:id(.:format)                                                 center#update
#                                        DELETE /center/:id(.:format)                                                 center#destroy
#                          notifications GET    /notifications(.:format)                                              notifications#index
#                                        POST   /notifications(.:format)                                              notifications#create
#                       new_notification GET    /notifications/new(.:format)                                          notifications#new
#                      edit_notification GET    /notifications/:id/edit(.:format)                                     notifications#edit
#                           notification GET    /notifications/:id(.:format)                                          notifications#show
#                                        PATCH  /notifications/:id(.:format)                                          notifications#update
#                                        PUT    /notifications/:id(.:format)                                          notifications#update
#                                        DELETE /notifications/:id(.:format)                                          notifications#destroy
#                           player_infos POST   /player_infos(.:format)                                               player_infos#create
#                        new_player_info GET    /player_infos/new(.:format)                                           player_infos#new
#                            player_info GET    /player_infos/:id(.:format)                                           player_infos#show
#     info_competition_activity_recruits GET    /info_competition/activities/:activity_id/recruits(.:format)          info_competition/recruits#index
#                                        POST   /info_competition/activities/:activity_id/recruits(.:format)          info_competition/recruits#create
#  new_info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/new(.:format)      info_competition/recruits#new
# edit_info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/:id/edit(.:format) info_competition/recruits#edit
#      info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/:id(.:format)      info_competition/recruits#show
#                                        PATCH  /info_competition/activities/:activity_id/recruits/:id(.:format)      info_competition/recruits#update
#                                        PUT    /info_competition/activities/:activity_id/recruits/:id(.:format)      info_competition/recruits#update
#                                        DELETE /info_competition/activities/:activity_id/recruits/:id(.:format)      info_competition/recruits#destroy
#            info_competition_activities GET    /info_competition/activities(.:format)                                info_competition/activities#index
#                                        POST   /info_competition/activities(.:format)                                info_competition/activities#create
#          new_info_competition_activity GET    /info_competition/activities/new(.:format)                            info_competition/activities#new
#         edit_info_competition_activity GET    /info_competition/activities/:id/edit(.:format)                       info_competition/activities#edit
#              info_competition_activity GET    /info_competition/activities/:id(.:format)                            info_competition/activities#show
#                                        PATCH  /info_competition/activities/:id(.:format)                            info_competition/activities#update
#                                        PUT    /info_competition/activities/:id(.:format)                            info_competition/activities#update
#                                        DELETE /info_competition/activities/:id(.:format)                            info_competition/activities#destroy
#              info_competition_recruits GET    /info_competition/recruits(.:format)                                  info_competition/recruits#index
#                                        POST   /info_competition/recruits(.:format)                                  info_competition/recruits#create
#           new_info_competition_recruit GET    /info_competition/recruits/new(.:format)                              info_competition/recruits#new
#          edit_info_competition_recruit GET    /info_competition/recruits/:id/edit(.:format)                         info_competition/recruits#edit
#               info_competition_recruit GET    /info_competition/recruits/:id(.:format)                              info_competition/recruits#show
#                                        PATCH  /info_competition/recruits/:id(.:format)                              info_competition/recruits#update
#                                        PUT    /info_competition/recruits/:id(.:format)                              info_competition/recruits#update
#                                        DELETE /info_competition/recruits/:id(.:format)                              info_competition/recruits#destroy
#     talk_competition_activity_recruits GET    /talk_competition/activities/:activity_id/recruits(.:format)          talk_competition/recruits#index
#                                        POST   /talk_competition/activities/:activity_id/recruits(.:format)          talk_competition/recruits#create
#  new_talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/new(.:format)      talk_competition/recruits#new
# edit_talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/:id/edit(.:format) talk_competition/recruits#edit
#      talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/:id(.:format)      talk_competition/recruits#show
#                                        PATCH  /talk_competition/activities/:activity_id/recruits/:id(.:format)      talk_competition/recruits#update
#                                        PUT    /talk_competition/activities/:activity_id/recruits/:id(.:format)      talk_competition/recruits#update
#                                        DELETE /talk_competition/activities/:activity_id/recruits/:id(.:format)      talk_competition/recruits#destroy
#            talk_competition_activities GET    /talk_competition/activities(.:format)                                talk_competition/activities#index
#                                        POST   /talk_competition/activities(.:format)                                talk_competition/activities#create
#          new_talk_competition_activity GET    /talk_competition/activities/new(.:format)                            talk_competition/activities#new
#         edit_talk_competition_activity GET    /talk_competition/activities/:id/edit(.:format)                       talk_competition/activities#edit
#              talk_competition_activity GET    /talk_competition/activities/:id(.:format)                            talk_competition/activities#show
#                                        PATCH  /talk_competition/activities/:id(.:format)                            talk_competition/activities#update
#                                        PUT    /talk_competition/activities/:id(.:format)                            talk_competition/activities#update
#                                        DELETE /talk_competition/activities/:id(.:format)                            talk_competition/activities#destroy
#              talk_competition_recruits GET    /talk_competition/recruits(.:format)                                  talk_competition/recruits#index
#                                        POST   /talk_competition/recruits(.:format)                                  talk_competition/recruits#create
#           new_talk_competition_recruit GET    /talk_competition/recruits/new(.:format)                              talk_competition/recruits#new
#          edit_talk_competition_recruit GET    /talk_competition/recruits/:id/edit(.:format)                         talk_competition/recruits#edit
#               talk_competition_recruit GET    /talk_competition/recruits/:id(.:format)                              talk_competition/recruits#show
#                                        PATCH  /talk_competition/recruits/:id(.:format)                              talk_competition/recruits#update
#                                        PUT    /talk_competition/recruits/:id(.:format)                              talk_competition/recruits#update
#                                        DELETE /talk_competition/recruits/:id(.:format)                              talk_competition/recruits#destroy
#                             admin_root GET    /admin(.:format)                                                      admin/home#index
#                            admin_users GET    /admin/users(.:format)                                                admin/users#index
#                                        POST   /admin/users(.:format)                                                admin/users#create
#                         new_admin_user GET    /admin/users/new(.:format)                                            admin/users#new
#                        edit_admin_user GET    /admin/users/:id/edit(.:format)                                       admin/users#edit
#                             admin_user GET    /admin/users/:id(.:format)                                            admin/users#show
#                                        PATCH  /admin/users/:id(.:format)                                            admin/users#update
#                                        PUT    /admin/users/:id(.:format)                                            admin/users#update
#                                        DELETE /admin/users/:id(.:format)                                            admin/users#destroy
#                       admin_activities GET    /admin/activities(.:format)                                           admin/activities#index
#                                        POST   /admin/activities(.:format)                                           admin/activities#create
#                     new_admin_activity GET    /admin/activities/new(.:format)                                       admin/activities#new
#                    edit_admin_activity GET    /admin/activities/:id/edit(.:format)                                  admin/activities#edit
#                         admin_activity GET    /admin/activities/:id(.:format)                                       admin/activities#show
#                                        PATCH  /admin/activities/:id(.:format)                                       admin/activities#update
#                                        PUT    /admin/activities/:id(.:format)                                       admin/activities#update
#                                        DELETE /admin/activities/:id(.:format)                                       admin/activities#destroy
#                       admin_news_index GET    /admin/news(.:format)                                                 admin/news#index
#                                        POST   /admin/news(.:format)                                                 admin/news#create
#                         new_admin_news GET    /admin/news/new(.:format)                                             admin/news#new
#                        edit_admin_news GET    /admin/news/:id/edit(.:format)                                        admin/news#edit
#                             admin_news GET    /admin/news/:id(.:format)                                             admin/news#show
#                                        PATCH  /admin/news/:id(.:format)                                             admin/news#update
#                                        PUT    /admin/news/:id(.:format)                                             admin/news#update
#                                        DELETE /admin/news/:id(.:format)                                             admin/news#destroy
#                        admin_bulletins GET    /admin/bulletins(.:format)                                            admin/bulletins#index
#                                        POST   /admin/bulletins(.:format)                                            admin/bulletins#create
#                     new_admin_bulletin GET    /admin/bulletins/new(.:format)                                        admin/bulletins#new
#                    edit_admin_bulletin GET    /admin/bulletins/:id/edit(.:format)                                   admin/bulletins#edit
#                         admin_bulletin GET    /admin/bulletins/:id(.:format)                                        admin/bulletins#show
#                                        PATCH  /admin/bulletins/:id(.:format)                                        admin/bulletins#update
#                                        PUT    /admin/bulletins/:id(.:format)                                        admin/bulletins#update
#                                        DELETE /admin/bulletins/:id(.:format)                                        admin/bulletins#destroy
#
