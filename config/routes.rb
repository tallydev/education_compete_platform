Rails.application.routes.draw do
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  
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

  devise_for :experts, controllers: {
    sessions: 'experts/sessions'
  }

  devise_for :school_users, controllers: {
    sessions: 'school_users/sessions'
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

  resource :center, only: [:show] do
    resources :activities, only: [:show] do
      resources :info_competitions, only: [:show, :index]
      resources :talk_competitions, only: [:show, :index]  
    end
    resource :player_info
  end

  resource :school_center, only: [:show]

  # 赛事公告
  resources :notifications

  # 用户信息资料
  resources :player_infos, only: [:new, :show, :create]

  # 信息大赛相关路由
  namespace :info_competition do
    # index用于给专家进行查看审批的列表
    # show用于给专家和参赛者都可以查看作品
    # update用于给参赛者进行作品修改更新
    resources :opuses, only: [:index, :show, :update]
    
    resources :activities do
      resources :recruits do
        collection do
          get :all
        end
      end
    end
    resources :recruits do
      # new, create用于给player进行上传作品
      resources :opuses, only: [:new, :create, :edit]
    end
  end

  # 说课大赛相关路由
  namespace :talk_competition do
    # index用于给专家进行查看审批的列表
    # show用于给专家和参赛者都可以查看作品
    # update用于给参赛者进行作品修改更新
    resources :opuses, only: [:index, :show]

    resources :activities do
      resources :recruits do
        collection do
          get :all
        end
      end
    end
    resources :recruits do
      # new, create用于给player进行上传作品
      resources :opuses, only: [:new, :create, :edit, :update]
    end
  end

  namespace :admin do 
    root to: "home#index"
    resources :users
    resources :activities do
      resources :recruits
    end
    resources :news
    resources :bulletins
  end

end

# == Route Map
#
#                                 Prefix Verb   URI Pattern                                                           Controller#Action
#                                  pdfjs        /pdfjs                                                                PdfjsViewer::Rails::Engine
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
#                     new_expert_session GET    /experts/sign_in(.:format)                                            experts/sessions#new
#                         expert_session POST   /experts/sign_in(.:format)                                            experts/sessions#create
#                 destroy_expert_session DELETE /experts/sign_out(.:format)                                           experts/sessions#destroy
#                        expert_password POST   /experts/password(.:format)                                           devise/passwords#create
#                    new_expert_password GET    /experts/password/new(.:format)                                       devise/passwords#new
#                   edit_expert_password GET    /experts/password/edit(.:format)                                      devise/passwords#edit
#                                        PATCH  /experts/password(.:format)                                           devise/passwords#update
#                                        PUT    /experts/password(.:format)                                           devise/passwords#update
#             cancel_expert_registration GET    /experts/cancel(.:format)                                             devise/registrations#cancel
#                    expert_registration POST   /experts(.:format)                                                    devise/registrations#create
#                new_expert_registration GET    /experts/sign_up(.:format)                                            devise/registrations#new
#               edit_expert_registration GET    /experts/edit(.:format)                                               devise/registrations#edit
#                                        PATCH  /experts(.:format)                                                    devise/registrations#update
#                                        PUT    /experts(.:format)                                                    devise/registrations#update
#                                        DELETE /experts(.:format)                                                    devise/registrations#destroy
#                new_school_user_session GET    /school_users/sign_in(.:format)                                       school_users/sessions#new
#                    school_user_session POST   /school_users/sign_in(.:format)                                       school_users/sessions#create
#            destroy_school_user_session DELETE /school_users/sign_out(.:format)                                      school_users/sessions#destroy
#                   school_user_password POST   /school_users/password(.:format)                                      devise/passwords#create
#               new_school_user_password GET    /school_users/password/new(.:format)                                  devise/passwords#new
#              edit_school_user_password GET    /school_users/password/edit(.:format)                                 devise/passwords#edit
#                                        PATCH  /school_users/password(.:format)                                      devise/passwords#update
#                                        PUT    /school_users/password(.:format)                                      devise/passwords#update
#        cancel_school_user_registration GET    /school_users/cancel(.:format)                                        devise/registrations#cancel
#               school_user_registration POST   /school_users(.:format)                                               devise/registrations#create
#           new_school_user_registration GET    /school_users/sign_up(.:format)                                       devise/registrations#new
#          edit_school_user_registration GET    /school_users/edit(.:format)                                          devise/registrations#edit
#                                        PATCH  /school_users(.:format)                                               devise/registrations#update
#                                        PUT    /school_users(.:format)                                               devise/registrations#update
#                                        DELETE /school_users(.:format)                                               devise/registrations#destroy
#      center_activity_info_competitions GET    /center/activities/:activity_id/info_competitions(.:format)           info_competitions#index
#       center_activity_info_competition GET    /center/activities/:activity_id/info_competitions/:id(.:format)       info_competitions#show
#      center_activity_talk_competitions GET    /center/activities/:activity_id/talk_competitions(.:format)           talk_competitions#index
#       center_activity_talk_competition GET    /center/activities/:activity_id/talk_competitions/:id(.:format)       talk_competitions#show
#                        center_activity GET    /center/activities/:id(.:format)                                      activities#show
#                     center_player_info POST   /center/player_info(.:format)                                         player_infos#create
#                 new_center_player_info GET    /center/player_info/new(.:format)                                     player_infos#new
#                edit_center_player_info GET    /center/player_info/edit(.:format)                                    player_infos#edit
#                                        GET    /center/player_info(.:format)                                         player_infos#show
#                                        PATCH  /center/player_info(.:format)                                         player_infos#update
#                                        PUT    /center/player_info(.:format)                                         player_infos#update
#                                        DELETE /center/player_info(.:format)                                         player_infos#destroy
#                                 center GET    /center(.:format)                                                     centers#show
#                          school_center GET    /school_center(.:format)                                              school_centers#show
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
#                info_competition_opuses GET    /info_competition/opuses(.:format)                                    info_competition/opuses#index
#                  info_competition_opus GET    /info_competition/opuses/:id(.:format)                                info_competition/opuses#show
#                                        PATCH  /info_competition/opuses/:id(.:format)                                info_competition/opuses#update
#                                        PUT    /info_competition/opuses/:id(.:format)                                info_competition/opuses#update
# all_info_competition_activity_recruits GET    /info_competition/activities/:activity_id/recruits/all(.:format)      info_competition/recruits#all
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
#        info_competition_recruit_opuses POST   /info_competition/recruits/:recruit_id/opuses(.:format)               info_competition/opuses#create
#      new_info_competition_recruit_opus GET    /info_competition/recruits/:recruit_id/opuses/new(.:format)           info_competition/opuses#new
#              info_competition_recruits GET    /info_competition/recruits(.:format)                                  info_competition/recruits#index
#                                        POST   /info_competition/recruits(.:format)                                  info_competition/recruits#create
#           new_info_competition_recruit GET    /info_competition/recruits/new(.:format)                              info_competition/recruits#new
#          edit_info_competition_recruit GET    /info_competition/recruits/:id/edit(.:format)                         info_competition/recruits#edit
#               info_competition_recruit GET    /info_competition/recruits/:id(.:format)                              info_competition/recruits#show
#                                        PATCH  /info_competition/recruits/:id(.:format)                              info_competition/recruits#update
#                                        PUT    /info_competition/recruits/:id(.:format)                              info_competition/recruits#update
#                                        DELETE /info_competition/recruits/:id(.:format)                              info_competition/recruits#destroy
# all_talk_competition_activity_recruits GET    /talk_competition/activities/:activity_id/recruits/all(.:format)      talk_competition/recruits#all
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
#        talk_competition_recruit_opuses POST   /talk_competition/recruits/:recruit_id/opuses(.:format)               talk_competition/opuses#create
#      new_talk_competition_recruit_opus GET    /talk_competition/recruits/:recruit_id/opuses/new(.:format)           talk_competition/opuses#new
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
# Routes for PdfjsViewer::Rails::Engine:
# minimal GET  /minimal(.:format) pdfjs_viewer/viewer#minimal
#    full GET  /full(.:format)    pdfjs_viewer/viewer#full
#
