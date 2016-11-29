Rails.application.routes.draw do
  
  resources :training_courses
  ###################### devise_for ####################
  # devise_for :school_users
  # devise_for :experts
  devise_for :admins
  devise_for :managers
  ################### appraises ########################
  resources :appraises, only: [:index, :show, :create] 
  
  resources :manager_feedbacks, only: [:index, :show, :create, :update]

  resources :player_feedbacks, only: [:index, :show, :create, :update]

  resources :events, only: [:index, :show]
  #####################  resourse  ##########################
  resources :resource_libraries, only: [:show, :index, :destroy, :create] do
    member do
      get :download
    end
  end
  ###########################################################
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  
  root to: "homes#index"
  
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

  # 手机端访问业务
  resources :phones

  # resources :center do 
  #   collection do
  #     get :info_competition
  #     get :talk_competition
  #     get :personal_info
  #   end
  # end

  resource :center, only: [:show] do
    resources :activities, only: [:show] do
      resources :info_competitions, only: [:show, :index] do
        collection do
          get :marks
        end
      end
      resources :talk_competitions, only: [:show, :index] do
        collection do
          get :marks
        end
      end
    end
    resource :player_info
  end

  resource :school_center, only: [:show]
  resource :expert_center, only: [:show]

  # 赛事公告
  resources :notifications

  # 用户信息资料
  resources :player_infos, only: [:new, :show, :create]

  resources :marks, only: [:update]
  resources :offline_marks, only: [:edit, :update]

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
      resources :offline_marks, only: [:index]
    end
    resources :recruits do
      # new, create用于给player进行上传作品
      resources :opuses, only: [:new, :create, :edit, :update]
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

    #########################################
    resources :appraises, only: [:index, :show] do
      collection do
        get :list
      end
    end

    resources :manager_feedbacks, only: [:show, :index] do
      collection do
          get :list
        end
    end

    resources :player_feedbacks, only: [:show, :index]

    resources :events, only: [:show, :index, :create, :update, :destroy]
    #########################################
    resources :users
    resources :activities do
      resources :info_competitions, only: [:show, :index, :edit, :update] do
        collection do
          get :print
        end
      end
      
      resources :talk_competitions, only: [:show, :index, :edit, :update] do
        collection do
          get :print
        end
      end

      resources :recruits
    end

    resources :news
    resources :bulletins
    resources :marks do
      collection do
        get :bind_new
      end
    end
    resources :experts
    # 为报名分配比赛(会copy一份当前的比赛)
    resource :assgin

    resources :info_competition do
      resources :activities do
        resources :recruits do
          collection do
            get :all
          end
        end
      end
    end
  end

  resources :talk_competition do
    resources :activities do
      resources :recruits do
        collection do
          get :all
        end
      end
    end
  end
end

# == Route Map
#
#                                       Prefix Verb   URI Pattern                                                                                      Controller#Action
#                                      apitome        /api/docs                                                                                        Apitome::Engine
#                             training_courses GET    /training_courses(.:format)                                                                      training_courses#index
#                                              POST   /training_courses(.:format)                                                                      training_courses#create
#                          new_training_course GET    /training_courses/new(.:format)                                                                  training_courses#new
#                         edit_training_course GET    /training_courses/:id/edit(.:format)                                                             training_courses#edit
#                              training_course GET    /training_courses/:id(.:format)                                                                  training_courses#show
#                                              PATCH  /training_courses/:id(.:format)                                                                  training_courses#update
#                                              PUT    /training_courses/:id(.:format)                                                                  training_courses#update
#                                              DELETE /training_courses/:id(.:format)                                                                  training_courses#destroy
#                            new_admin_session GET    /admins/sign_in(.:format)                                                                        devise/sessions#new
#                                admin_session POST   /admins/sign_in(.:format)                                                                        devise/sessions#create
#                        destroy_admin_session DELETE /admins/sign_out(.:format)                                                                       devise/sessions#destroy
#                               admin_password POST   /admins/password(.:format)                                                                       devise/passwords#create
#                           new_admin_password GET    /admins/password/new(.:format)                                                                   devise/passwords#new
#                          edit_admin_password GET    /admins/password/edit(.:format)                                                                  devise/passwords#edit
#                                              PATCH  /admins/password(.:format)                                                                       devise/passwords#update
#                                              PUT    /admins/password(.:format)                                                                       devise/passwords#update
#                    cancel_admin_registration GET    /admins/cancel(.:format)                                                                         devise/registrations#cancel
#                           admin_registration POST   /admins(.:format)                                                                                devise/registrations#create
#                       new_admin_registration GET    /admins/sign_up(.:format)                                                                        devise/registrations#new
#                      edit_admin_registration GET    /admins/edit(.:format)                                                                           devise/registrations#edit
#                                              PATCH  /admins(.:format)                                                                                devise/registrations#update
#                                              PUT    /admins(.:format)                                                                                devise/registrations#update
#                                              DELETE /admins(.:format)                                                                                devise/registrations#destroy
#                          new_manager_session GET    /managers/sign_in(.:format)                                                                      devise/sessions#new
#                              manager_session POST   /managers/sign_in(.:format)                                                                      devise/sessions#create
#                      destroy_manager_session DELETE /managers/sign_out(.:format)                                                                     devise/sessions#destroy
#                             manager_password POST   /managers/password(.:format)                                                                     devise/passwords#create
#                         new_manager_password GET    /managers/password/new(.:format)                                                                 devise/passwords#new
#                        edit_manager_password GET    /managers/password/edit(.:format)                                                                devise/passwords#edit
#                                              PATCH  /managers/password(.:format)                                                                     devise/passwords#update
#                                              PUT    /managers/password(.:format)                                                                     devise/passwords#update
#                  cancel_manager_registration GET    /managers/cancel(.:format)                                                                       devise/registrations#cancel
#                         manager_registration POST   /managers(.:format)                                                                              devise/registrations#create
#                     new_manager_registration GET    /managers/sign_up(.:format)                                                                      devise/registrations#new
#                    edit_manager_registration GET    /managers/edit(.:format)                                                                         devise/registrations#edit
#                                              PATCH  /managers(.:format)                                                                              devise/registrations#update
#                                              PUT    /managers(.:format)                                                                              devise/registrations#update
#                                              DELETE /managers(.:format)                                                                              devise/registrations#destroy
#                               list_appraises GET    /appraises/list(.:format)                                                                        appraises#list
#                                    appraises GET    /appraises(.:format)                                                                             appraises#index
#                                              POST   /appraises(.:format)                                                                             appraises#create
#                                     appraise GET    /appraises/:id(.:format)                                                                         appraises#show
#                            manager_feedbacks GET    /manager_feedbacks(.:format)                                                                     manager_feedbacks#index
#                                              POST   /manager_feedbacks(.:format)                                                                     manager_feedbacks#create
#                             manager_feedback GET    /manager_feedbacks/:id(.:format)                                                                 manager_feedbacks#show
#                                              PATCH  /manager_feedbacks/:id(.:format)                                                                 manager_feedbacks#update
#                                              PUT    /manager_feedbacks/:id(.:format)                                                                 manager_feedbacks#update
#                             player_feedbacks GET    /player_feedbacks(.:format)                                                                      player_feedbacks#index
#                                              POST   /player_feedbacks(.:format)                                                                      player_feedbacks#create
#                              player_feedback GET    /player_feedbacks/:id(.:format)                                                                  player_feedbacks#show
#                                              PATCH  /player_feedbacks/:id(.:format)                                                                  player_feedbacks#update
#                                              PUT    /player_feedbacks/:id(.:format)                                                                  player_feedbacks#update
#                                       events GET    /events(.:format)                                                                                events#index
#                                        event GET    /events/:id(.:format)                                                                            events#show
#                    download_resource_library GET    /resource_libraries/:id/download(.:format)                                                       resource_libraries#download
#                           resource_libraries GET    /resource_libraries(.:format)                                                                    resource_libraries#index
#                                              POST   /resource_libraries(.:format)                                                                    resource_libraries#create
#                             resource_library GET    /resource_libraries/:id(.:format)                                                                resource_libraries#show
#                                              DELETE /resource_libraries/:id(.:format)                                                                resource_libraries#destroy
#                                        pdfjs        /pdfjs                                                                                           PdfjsViewer::Rails::Engine
#                                         root GET    /                                                                                                homes#index
#                             new_user_session GET    /users/sign_in(.:format)                                                                         user/sessions#new
#                                 user_session POST   /users/sign_in(.:format)                                                                         user/sessions#create
#                         destroy_user_session DELETE /users/sign_out(.:format)                                                                        user/sessions#destroy
#                                user_password POST   /users/password(.:format)                                                                        user/passwords#create
#                            new_user_password GET    /users/password/new(.:format)                                                                    user/passwords#new
#                           edit_user_password GET    /users/password/edit(.:format)                                                                   user/passwords#edit
#                                              PATCH  /users/password(.:format)                                                                        user/passwords#update
#                                              PUT    /users/password(.:format)                                                                        user/passwords#update
#                     cancel_user_registration GET    /users/cancel(.:format)                                                                          devise/registrations#cancel
#                            user_registration POST   /users(.:format)                                                                                 devise/registrations#create
#                        new_user_registration GET    /users/sign_up(.:format)                                                                         devise/registrations#new
#                       edit_user_registration GET    /users/edit(.:format)                                                                            devise/registrations#edit
#                                              PATCH  /users(.:format)                                                                                 devise/registrations#update
#                                              PUT    /users(.:format)                                                                                 devise/registrations#update
#                                              DELETE /users(.:format)                                                                                 devise/registrations#destroy
#                           new_player_session GET    /players/sign_in(.:format)                                                                       players/sessions#new
#                               player_session POST   /players/sign_in(.:format)                                                                       players/sessions#create
#                       destroy_player_session DELETE /players/sign_out(.:format)                                                                      players/sessions#destroy
#                              player_password POST   /players/password(.:format)                                                                      players/passwords#create
#                          new_player_password GET    /players/password/new(.:format)                                                                  players/passwords#new
#                         edit_player_password GET    /players/password/edit(.:format)                                                                 players/passwords#edit
#                                              PATCH  /players/password(.:format)                                                                      players/passwords#update
#                                              PUT    /players/password(.:format)                                                                      players/passwords#update
#                   cancel_player_registration GET    /players/cancel(.:format)                                                                        players/registrations#cancel
#                          player_registration POST   /players(.:format)                                                                               players/registrations#create
#                      new_player_registration GET    /players/sign_up(.:format)                                                                       players/registrations#new
#                     edit_player_registration GET    /players/edit(.:format)                                                                          players/registrations#edit
#                                              PATCH  /players(.:format)                                                                               players/registrations#update
#                                              PUT    /players(.:format)                                                                               players/registrations#update
#                                              DELETE /players(.:format)                                                                               players/registrations#destroy
#                           new_expert_session GET    /experts/sign_in(.:format)                                                                       experts/sessions#new
#                               expert_session POST   /experts/sign_in(.:format)                                                                       experts/sessions#create
#                       destroy_expert_session DELETE /experts/sign_out(.:format)                                                                      experts/sessions#destroy
#                              expert_password POST   /experts/password(.:format)                                                                      devise/passwords#create
#                          new_expert_password GET    /experts/password/new(.:format)                                                                  devise/passwords#new
#                         edit_expert_password GET    /experts/password/edit(.:format)                                                                 devise/passwords#edit
#                                              PATCH  /experts/password(.:format)                                                                      devise/passwords#update
#                                              PUT    /experts/password(.:format)                                                                      devise/passwords#update
#                   cancel_expert_registration GET    /experts/cancel(.:format)                                                                        devise/registrations#cancel
#                          expert_registration POST   /experts(.:format)                                                                               devise/registrations#create
#                      new_expert_registration GET    /experts/sign_up(.:format)                                                                       devise/registrations#new
#                     edit_expert_registration GET    /experts/edit(.:format)                                                                          devise/registrations#edit
#                                              PATCH  /experts(.:format)                                                                               devise/registrations#update
#                                              PUT    /experts(.:format)                                                                               devise/registrations#update
#                                              DELETE /experts(.:format)                                                                               devise/registrations#destroy
#                      new_school_user_session GET    /school_users/sign_in(.:format)                                                                  school_users/sessions#new
#                          school_user_session POST   /school_users/sign_in(.:format)                                                                  school_users/sessions#create
#                  destroy_school_user_session DELETE /school_users/sign_out(.:format)                                                                 school_users/sessions#destroy
#                         school_user_password POST   /school_users/password(.:format)                                                                 devise/passwords#create
#                     new_school_user_password GET    /school_users/password/new(.:format)                                                             devise/passwords#new
#                    edit_school_user_password GET    /school_users/password/edit(.:format)                                                            devise/passwords#edit
#                                              PATCH  /school_users/password(.:format)                                                                 devise/passwords#update
#                                              PUT    /school_users/password(.:format)                                                                 devise/passwords#update
#              cancel_school_user_registration GET    /school_users/cancel(.:format)                                                                   devise/registrations#cancel
#                     school_user_registration POST   /school_users(.:format)                                                                          devise/registrations#create
#                 new_school_user_registration GET    /school_users/sign_up(.:format)                                                                  devise/registrations#new
#                edit_school_user_registration GET    /school_users/edit(.:format)                                                                     devise/registrations#edit
#                                              PATCH  /school_users(.:format)                                                                          devise/registrations#update
#                                              PUT    /school_users(.:format)                                                                          devise/registrations#update
#                                              DELETE /school_users(.:format)                                                                          devise/registrations#destroy
#                                       phones GET    /phones(.:format)                                                                                phones#index
#                                              POST   /phones(.:format)                                                                                phones#create
#                                    new_phone GET    /phones/new(.:format)                                                                            phones#new
#                                   edit_phone GET    /phones/:id/edit(.:format)                                                                       phones#edit
#                                        phone GET    /phones/:id(.:format)                                                                            phones#show
#                                              PATCH  /phones/:id(.:format)                                                                            phones#update
#                                              PUT    /phones/:id(.:format)                                                                            phones#update
#                                              DELETE /phones/:id(.:format)                                                                            phones#destroy
#      marks_center_activity_info_competitions GET    /center/activities/:activity_id/info_competitions/marks(.:format)                                info_competitions#marks
#            center_activity_info_competitions GET    /center/activities/:activity_id/info_competitions(.:format)                                      info_competitions#index
#             center_activity_info_competition GET    /center/activities/:activity_id/info_competitions/:id(.:format)                                  info_competitions#show
#      marks_center_activity_talk_competitions GET    /center/activities/:activity_id/talk_competitions/marks(.:format)                                talk_competitions#marks
#            center_activity_talk_competitions GET    /center/activities/:activity_id/talk_competitions(.:format)                                      talk_competitions#index
#             center_activity_talk_competition GET    /center/activities/:activity_id/talk_competitions/:id(.:format)                                  talk_competitions#show
#                              center_activity GET    /center/activities/:id(.:format)                                                                 activities#show
#                           center_player_info POST   /center/player_info(.:format)                                                                    player_infos#create
#                       new_center_player_info GET    /center/player_info/new(.:format)                                                                player_infos#new
#                      edit_center_player_info GET    /center/player_info/edit(.:format)                                                               player_infos#edit
#                                              GET    /center/player_info(.:format)                                                                    player_infos#show
#                                              PATCH  /center/player_info(.:format)                                                                    player_infos#update
#                                              PUT    /center/player_info(.:format)                                                                    player_infos#update
#                                              DELETE /center/player_info(.:format)                                                                    player_infos#destroy
#                                       center GET    /center(.:format)                                                                                centers#show
#                                school_center GET    /school_center(.:format)                                                                         school_centers#show
#                                expert_center GET    /expert_center(.:format)                                                                         expert_centers#show
#                                notifications GET    /notifications(.:format)                                                                         notifications#index
#                                              POST   /notifications(.:format)                                                                         notifications#create
#                             new_notification GET    /notifications/new(.:format)                                                                     notifications#new
#                            edit_notification GET    /notifications/:id/edit(.:format)                                                                notifications#edit
#                                 notification GET    /notifications/:id(.:format)                                                                     notifications#show
#                                              PATCH  /notifications/:id(.:format)                                                                     notifications#update
#                                              PUT    /notifications/:id(.:format)                                                                     notifications#update
#                                              DELETE /notifications/:id(.:format)                                                                     notifications#destroy
#                                 player_infos POST   /player_infos(.:format)                                                                          player_infos#create
#                              new_player_info GET    /player_infos/new(.:format)                                                                      player_infos#new
#                                  player_info GET    /player_infos/:id(.:format)                                                                      player_infos#show
#                                         mark PATCH  /marks/:id(.:format)                                                                             marks#update
#                                              PUT    /marks/:id(.:format)                                                                             marks#update
#                            edit_offline_mark GET    /offline_marks/:id/edit(.:format)                                                                offline_marks#edit
#                                 offline_mark PATCH  /offline_marks/:id(.:format)                                                                     offline_marks#update
#                                              PUT    /offline_marks/:id(.:format)                                                                     offline_marks#update
#                      info_competition_opuses GET    /info_competition/opuses(.:format)                                                               info_competition/opuses#index
#                        info_competition_opus GET    /info_competition/opuses/:id(.:format)                                                           info_competition/opuses#show
#                                              PATCH  /info_competition/opuses/:id(.:format)                                                           info_competition/opuses#update
#                                              PUT    /info_competition/opuses/:id(.:format)                                                           info_competition/opuses#update
#       all_info_competition_activity_recruits GET    /info_competition/activities/:activity_id/recruits/all(.:format)                                 info_competition/recruits#all
#           info_competition_activity_recruits GET    /info_competition/activities/:activity_id/recruits(.:format)                                     info_competition/recruits#index
#                                              POST   /info_competition/activities/:activity_id/recruits(.:format)                                     info_competition/recruits#create
#        new_info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/new(.:format)                                 info_competition/recruits#new
#       edit_info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/:id/edit(.:format)                            info_competition/recruits#edit
#            info_competition_activity_recruit GET    /info_competition/activities/:activity_id/recruits/:id(.:format)                                 info_competition/recruits#show
#                                              PATCH  /info_competition/activities/:activity_id/recruits/:id(.:format)                                 info_competition/recruits#update
#                                              PUT    /info_competition/activities/:activity_id/recruits/:id(.:format)                                 info_competition/recruits#update
#                                              DELETE /info_competition/activities/:activity_id/recruits/:id(.:format)                                 info_competition/recruits#destroy
#      info_competition_activity_offline_marks GET    /info_competition/activities/:activity_id/offline_marks(.:format)                                info_competition/offline_marks#index
#                  info_competition_activities GET    /info_competition/activities(.:format)                                                           info_competition/activities#index
#                                              POST   /info_competition/activities(.:format)                                                           info_competition/activities#create
#                new_info_competition_activity GET    /info_competition/activities/new(.:format)                                                       info_competition/activities#new
#               edit_info_competition_activity GET    /info_competition/activities/:id/edit(.:format)                                                  info_competition/activities#edit
#                    info_competition_activity GET    /info_competition/activities/:id(.:format)                                                       info_competition/activities#show
#                                              PATCH  /info_competition/activities/:id(.:format)                                                       info_competition/activities#update
#                                              PUT    /info_competition/activities/:id(.:format)                                                       info_competition/activities#update
#                                              DELETE /info_competition/activities/:id(.:format)                                                       info_competition/activities#destroy
#              info_competition_recruit_opuses POST   /info_competition/recruits/:recruit_id/opuses(.:format)                                          info_competition/opuses#create
#            new_info_competition_recruit_opus GET    /info_competition/recruits/:recruit_id/opuses/new(.:format)                                      info_competition/opuses#new
#           edit_info_competition_recruit_opus GET    /info_competition/recruits/:recruit_id/opuses/:id/edit(.:format)                                 info_competition/opuses#edit
#                info_competition_recruit_opus PATCH  /info_competition/recruits/:recruit_id/opuses/:id(.:format)                                      info_competition/opuses#update
#                                              PUT    /info_competition/recruits/:recruit_id/opuses/:id(.:format)                                      info_competition/opuses#update
#                    info_competition_recruits GET    /info_competition/recruits(.:format)                                                             info_competition/recruits#index
#                                              POST   /info_competition/recruits(.:format)                                                             info_competition/recruits#create
#                 new_info_competition_recruit GET    /info_competition/recruits/new(.:format)                                                         info_competition/recruits#new
#                edit_info_competition_recruit GET    /info_competition/recruits/:id/edit(.:format)                                                    info_competition/recruits#edit
#                     info_competition_recruit GET    /info_competition/recruits/:id(.:format)                                                         info_competition/recruits#show
#                                              PATCH  /info_competition/recruits/:id(.:format)                                                         info_competition/recruits#update
#                                              PUT    /info_competition/recruits/:id(.:format)                                                         info_competition/recruits#update
#                                              DELETE /info_competition/recruits/:id(.:format)                                                         info_competition/recruits#destroy
#                      talk_competition_opuses GET    /talk_competition/opuses(.:format)                                                               talk_competition/opuses#index
#                        talk_competition_opus GET    /talk_competition/opuses/:id(.:format)                                                           talk_competition/opuses#show
#       all_talk_competition_activity_recruits GET    /talk_competition/activities/:activity_id/recruits/all(.:format)                                 talk_competition/recruits#all
#           talk_competition_activity_recruits GET    /talk_competition/activities/:activity_id/recruits(.:format)                                     talk_competition/recruits#index
#                                              POST   /talk_competition/activities/:activity_id/recruits(.:format)                                     talk_competition/recruits#create
#        new_talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/new(.:format)                                 talk_competition/recruits#new
#       edit_talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/:id/edit(.:format)                            talk_competition/recruits#edit
#            talk_competition_activity_recruit GET    /talk_competition/activities/:activity_id/recruits/:id(.:format)                                 talk_competition/recruits#show
#                                              PATCH  /talk_competition/activities/:activity_id/recruits/:id(.:format)                                 talk_competition/recruits#update
#                                              PUT    /talk_competition/activities/:activity_id/recruits/:id(.:format)                                 talk_competition/recruits#update
#                                              DELETE /talk_competition/activities/:activity_id/recruits/:id(.:format)                                 talk_competition/recruits#destroy
#                  talk_competition_activities GET    /talk_competition/activities(.:format)                                                           talk_competition/activities#index
#                                              POST   /talk_competition/activities(.:format)                                                           talk_competition/activities#create
#                new_talk_competition_activity GET    /talk_competition/activities/new(.:format)                                                       talk_competition/activities#new
#               edit_talk_competition_activity GET    /talk_competition/activities/:id/edit(.:format)                                                  talk_competition/activities#edit
#                    talk_competition_activity GET    /talk_competition/activities/:id(.:format)                                                       talk_competition/activities#show
#                                              PATCH  /talk_competition/activities/:id(.:format)                                                       talk_competition/activities#update
#                                              PUT    /talk_competition/activities/:id(.:format)                                                       talk_competition/activities#update
#                                              DELETE /talk_competition/activities/:id(.:format)                                                       talk_competition/activities#destroy
#              talk_competition_recruit_opuses POST   /talk_competition/recruits/:recruit_id/opuses(.:format)                                          talk_competition/opuses#create
#            new_talk_competition_recruit_opus GET    /talk_competition/recruits/:recruit_id/opuses/new(.:format)                                      talk_competition/opuses#new
#           edit_talk_competition_recruit_opus GET    /talk_competition/recruits/:recruit_id/opuses/:id/edit(.:format)                                 talk_competition/opuses#edit
#                talk_competition_recruit_opus PATCH  /talk_competition/recruits/:recruit_id/opuses/:id(.:format)                                      talk_competition/opuses#update
#                                              PUT    /talk_competition/recruits/:recruit_id/opuses/:id(.:format)                                      talk_competition/opuses#update
#                    talk_competition_recruits GET    /talk_competition/recruits(.:format)                                                             talk_competition/recruits#index
#                                              POST   /talk_competition/recruits(.:format)                                                             talk_competition/recruits#create
#                 new_talk_competition_recruit GET    /talk_competition/recruits/new(.:format)                                                         talk_competition/recruits#new
#                edit_talk_competition_recruit GET    /talk_competition/recruits/:id/edit(.:format)                                                    talk_competition/recruits#edit
#                     talk_competition_recruit GET    /talk_competition/recruits/:id(.:format)                                                         talk_competition/recruits#show
#                                              PATCH  /talk_competition/recruits/:id(.:format)                                                         talk_competition/recruits#update
#                                              PUT    /talk_competition/recruits/:id(.:format)                                                         talk_competition/recruits#update
#                                              DELETE /talk_competition/recruits/:id(.:format)                                                         talk_competition/recruits#destroy
#                                   admin_root GET    /admin(.:format)                                                                                 admin/home#index
#                 list_admin_manager_feedbacks GET    /admin/manager_feedbacks/list(.:format)                                                          admin/manager_feedbacks#list
#                      admin_manager_feedbacks GET    /admin/manager_feedbacks(.:format)                                                               admin/manager_feedbacks#index
#                       admin_manager_feedback GET    /admin/manager_feedbacks/:id(.:format)                                                           admin/manager_feedbacks#show
#                       admin_player_feedbacks GET    /admin/player_feedbacks(.:format)                                                                admin/player_feedbacks#index
#                        admin_player_feedback GET    /admin/player_feedbacks/:id(.:format)                                                            admin/player_feedbacks#show
#                                 admin_events GET    /admin/events(.:format)                                                                          admin/events#index
#                                              POST   /admin/events(.:format)                                                                          admin/events#create
#                                  admin_event GET    /admin/events/:id(.:format)                                                                      admin/events#show
#                                              PATCH  /admin/events/:id(.:format)                                                                      admin/events#update
#                                              PUT    /admin/events/:id(.:format)                                                                      admin/events#update
#                                              DELETE /admin/events/:id(.:format)                                                                      admin/events#destroy
#                                  admin_users GET    /admin/users(.:format)                                                                           admin/users#index
#                                              POST   /admin/users(.:format)                                                                           admin/users#create
#                               new_admin_user GET    /admin/users/new(.:format)                                                                       admin/users#new
#                              edit_admin_user GET    /admin/users/:id/edit(.:format)                                                                  admin/users#edit
#                                   admin_user GET    /admin/users/:id(.:format)                                                                       admin/users#show
#                                              PATCH  /admin/users/:id(.:format)                                                                       admin/users#update
#                                              PUT    /admin/users/:id(.:format)                                                                       admin/users#update
#                                              DELETE /admin/users/:id(.:format)                                                                       admin/users#destroy
#       print_admin_activity_info_competitions GET    /admin/activities/:activity_id/info_competitions/print(.:format)                                 admin/info_competitions#print
#             admin_activity_info_competitions GET    /admin/activities/:activity_id/info_competitions(.:format)                                       admin/info_competitions#index
#         edit_admin_activity_info_competition GET    /admin/activities/:activity_id/info_competitions/:id/edit(.:format)                              admin/info_competitions#edit
#              admin_activity_info_competition GET    /admin/activities/:activity_id/info_competitions/:id(.:format)                                   admin/info_competitions#show
#                                              PATCH  /admin/activities/:activity_id/info_competitions/:id(.:format)                                   admin/info_competitions#update
#                                              PUT    /admin/activities/:activity_id/info_competitions/:id(.:format)                                   admin/info_competitions#update
#       print_admin_activity_talk_competitions GET    /admin/activities/:activity_id/talk_competitions/print(.:format)                                 admin/talk_competitions#print
#             admin_activity_talk_competitions GET    /admin/activities/:activity_id/talk_competitions(.:format)                                       admin/talk_competitions#index
#         edit_admin_activity_talk_competition GET    /admin/activities/:activity_id/talk_competitions/:id/edit(.:format)                              admin/talk_competitions#edit
#              admin_activity_talk_competition GET    /admin/activities/:activity_id/talk_competitions/:id(.:format)                                   admin/talk_competitions#show
#                                              PATCH  /admin/activities/:activity_id/talk_competitions/:id(.:format)                                   admin/talk_competitions#update
#                                              PUT    /admin/activities/:activity_id/talk_competitions/:id(.:format)                                   admin/talk_competitions#update
#                      admin_activity_recruits GET    /admin/activities/:activity_id/recruits(.:format)                                                admin/recruits#index
#                                              POST   /admin/activities/:activity_id/recruits(.:format)                                                admin/recruits#create
#                   new_admin_activity_recruit GET    /admin/activities/:activity_id/recruits/new(.:format)                                            admin/recruits#new
#                  edit_admin_activity_recruit GET    /admin/activities/:activity_id/recruits/:id/edit(.:format)                                       admin/recruits#edit
#                       admin_activity_recruit GET    /admin/activities/:activity_id/recruits/:id(.:format)                                            admin/recruits#show
#                                              PATCH  /admin/activities/:activity_id/recruits/:id(.:format)                                            admin/recruits#update
#                                              PUT    /admin/activities/:activity_id/recruits/:id(.:format)                                            admin/recruits#update
#                                              DELETE /admin/activities/:activity_id/recruits/:id(.:format)                                            admin/recruits#destroy
#                             admin_activities GET    /admin/activities(.:format)                                                                      admin/activities#index
#                                              POST   /admin/activities(.:format)                                                                      admin/activities#create
#                           new_admin_activity GET    /admin/activities/new(.:format)                                                                  admin/activities#new
#                          edit_admin_activity GET    /admin/activities/:id/edit(.:format)                                                             admin/activities#edit
#                               admin_activity GET    /admin/activities/:id(.:format)                                                                  admin/activities#show
#                                              PATCH  /admin/activities/:id(.:format)                                                                  admin/activities#update
#                                              PUT    /admin/activities/:id(.:format)                                                                  admin/activities#update
#                                              DELETE /admin/activities/:id(.:format)                                                                  admin/activities#destroy
#                             admin_news_index GET    /admin/news(.:format)                                                                            admin/news#index
#                                              POST   /admin/news(.:format)                                                                            admin/news#create
#                               new_admin_news GET    /admin/news/new(.:format)                                                                        admin/news#new
#                              edit_admin_news GET    /admin/news/:id/edit(.:format)                                                                   admin/news#edit
#                                   admin_news GET    /admin/news/:id(.:format)                                                                        admin/news#show
#                                              PATCH  /admin/news/:id(.:format)                                                                        admin/news#update
#                                              PUT    /admin/news/:id(.:format)                                                                        admin/news#update
#                                              DELETE /admin/news/:id(.:format)                                                                        admin/news#destroy
#                              admin_bulletins GET    /admin/bulletins(.:format)                                                                       admin/bulletins#index
#                                              POST   /admin/bulletins(.:format)                                                                       admin/bulletins#create
#                           new_admin_bulletin GET    /admin/bulletins/new(.:format)                                                                   admin/bulletins#new
#                          edit_admin_bulletin GET    /admin/bulletins/:id/edit(.:format)                                                              admin/bulletins#edit
#                               admin_bulletin GET    /admin/bulletins/:id(.:format)                                                                   admin/bulletins#show
#                                              PATCH  /admin/bulletins/:id(.:format)                                                                   admin/bulletins#update
#                                              PUT    /admin/bulletins/:id(.:format)                                                                   admin/bulletins#update
#                                              DELETE /admin/bulletins/:id(.:format)                                                                   admin/bulletins#destroy
#                         bind_new_admin_marks GET    /admin/marks/bind_new(.:format)                                                                  admin/marks#bind_new
#                                  admin_marks GET    /admin/marks(.:format)                                                                           admin/marks#index
#                                              POST   /admin/marks(.:format)                                                                           admin/marks#create
#                               new_admin_mark GET    /admin/marks/new(.:format)                                                                       admin/marks#new
#                              edit_admin_mark GET    /admin/marks/:id/edit(.:format)                                                                  admin/marks#edit
#                                   admin_mark GET    /admin/marks/:id(.:format)                                                                       admin/marks#show
#                                              PATCH  /admin/marks/:id(.:format)                                                                       admin/marks#update
#                                              PUT    /admin/marks/:id(.:format)                                                                       admin/marks#update
#                                              DELETE /admin/marks/:id(.:format)                                                                       admin/marks#destroy
#                                admin_experts GET    /admin/experts(.:format)                                                                         admin/experts#index
#                                              POST   /admin/experts(.:format)                                                                         admin/experts#create
#                             new_admin_expert GET    /admin/experts/new(.:format)                                                                     admin/experts#new
#                            edit_admin_expert GET    /admin/experts/:id/edit(.:format)                                                                admin/experts#edit
#                                 admin_expert GET    /admin/experts/:id(.:format)                                                                     admin/experts#show
#                                              PATCH  /admin/experts/:id(.:format)                                                                     admin/experts#update
#                                              PUT    /admin/experts/:id(.:format)                                                                     admin/experts#update
#                                              DELETE /admin/experts/:id(.:format)                                                                     admin/experts#destroy
#                                 admin_assgin POST   /admin/assgin(.:format)                                                                          admin/assgins#create
#                             new_admin_assgin GET    /admin/assgin/new(.:format)                                                                      admin/assgins#new
#                            edit_admin_assgin GET    /admin/assgin/edit(.:format)                                                                     admin/assgins#edit
#                                              GET    /admin/assgin(.:format)                                                                          admin/assgins#show
#                                              PATCH  /admin/assgin(.:format)                                                                          admin/assgins#update
#                                              PUT    /admin/assgin(.:format)                                                                          admin/assgins#update
#                                              DELETE /admin/assgin(.:format)                                                                          admin/assgins#destroy
# all_admin_info_competition_activity_recruits GET    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/all(.:format)      admin/recruits#all
#     admin_info_competition_activity_recruits GET    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits(.:format)          admin/recruits#index
#                                              POST   /admin/info_competition/:info_competition_id/activities/:activity_id/recruits(.:format)          admin/recruits#create
#  new_admin_info_competition_activity_recruit GET    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/new(.:format)      admin/recruits#new
# edit_admin_info_competition_activity_recruit GET    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/:id/edit(.:format) admin/recruits#edit
#      admin_info_competition_activity_recruit GET    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/:id(.:format)      admin/recruits#show
#                                              PATCH  /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/:id(.:format)      admin/recruits#update
#                                              PUT    /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/:id(.:format)      admin/recruits#update
#                                              DELETE /admin/info_competition/:info_competition_id/activities/:activity_id/recruits/:id(.:format)      admin/recruits#destroy
#            admin_info_competition_activities GET    /admin/info_competition/:info_competition_id/activities(.:format)                                admin/activities#index
#                                              POST   /admin/info_competition/:info_competition_id/activities(.:format)                                admin/activities#create
#          new_admin_info_competition_activity GET    /admin/info_competition/:info_competition_id/activities/new(.:format)                            admin/activities#new
#         edit_admin_info_competition_activity GET    /admin/info_competition/:info_competition_id/activities/:id/edit(.:format)                       admin/activities#edit
#              admin_info_competition_activity GET    /admin/info_competition/:info_competition_id/activities/:id(.:format)                            admin/activities#show
#                                              PATCH  /admin/info_competition/:info_competition_id/activities/:id(.:format)                            admin/activities#update
#                                              PUT    /admin/info_competition/:info_competition_id/activities/:id(.:format)                            admin/activities#update
#                                              DELETE /admin/info_competition/:info_competition_id/activities/:id(.:format)                            admin/activities#destroy
#                 admin_info_competition_index GET    /admin/info_competition(.:format)                                                                admin/info_competition#index
#                                              POST   /admin/info_competition(.:format)                                                                admin/info_competition#create
#                   new_admin_info_competition GET    /admin/info_competition/new(.:format)                                                            admin/info_competition#new
#                  edit_admin_info_competition GET    /admin/info_competition/:id/edit(.:format)                                                       admin/info_competition#edit
#                       admin_info_competition GET    /admin/info_competition/:id(.:format)                                                            admin/info_competition#show
#                                              PATCH  /admin/info_competition/:id(.:format)                                                            admin/info_competition#update
#                                              PUT    /admin/info_competition/:id(.:format)                                                            admin/info_competition#update
#                                              DELETE /admin/info_competition/:id(.:format)                                                            admin/info_competition#destroy
#                                              GET    /talk_competition/:talk_competition_id/activities/:activity_id/recruits/all(.:format)            recruits#all
#                                              GET    /talk_competition/:talk_competition_id/activities/:activity_id/recruits(.:format)                recruits#index
#                                              POST   /talk_competition/:talk_competition_id/activities/:activity_id/recruits(.:format)                recruits#create
#                                              GET    /talk_competition/:talk_competition_id/activities/:activity_id/recruits/new(.:format)            recruits#new
#                                              GET    /talk_competition/:talk_competition_id/activities/:activity_id/recruits/:id/edit(.:format)       recruits#edit
#                                              GET    /talk_competition/:talk_competition_id/activities/:activity_id/recruits/:id(.:format)            recruits#show
#                                              PATCH  /talk_competition/:talk_competition_id/activities/:activity_id/recruits/:id(.:format)            recruits#update
#                                              PUT    /talk_competition/:talk_competition_id/activities/:activity_id/recruits/:id(.:format)            recruits#update
#                                              DELETE /talk_competition/:talk_competition_id/activities/:activity_id/recruits/:id(.:format)            recruits#destroy
#                                              GET    /talk_competition/:talk_competition_id/activities(.:format)                                      activities#index
#                                              POST   /talk_competition/:talk_competition_id/activities(.:format)                                      activities#create
#                                              GET    /talk_competition/:talk_competition_id/activities/new(.:format)                                  activities#new
#                                              GET    /talk_competition/:talk_competition_id/activities/:id/edit(.:format)                             activities#edit
#                                              GET    /talk_competition/:talk_competition_id/activities/:id(.:format)                                  activities#show
#                                              PATCH  /talk_competition/:talk_competition_id/activities/:id(.:format)                                  activities#update
#                                              PUT    /talk_competition/:talk_competition_id/activities/:id(.:format)                                  activities#update
#                                              DELETE /talk_competition/:talk_competition_id/activities/:id(.:format)                                  activities#destroy
#                       talk_competition_index GET    /talk_competition(.:format)                                                                      talk_competition#index
#                                              POST   /talk_competition(.:format)                                                                      talk_competition#create
#                         new_talk_competition GET    /talk_competition/new(.:format)                                                                  talk_competition#new
#                        edit_talk_competition GET    /talk_competition/:id/edit(.:format)                                                             talk_competition#edit
#                             talk_competition GET    /talk_competition/:id(.:format)                                                                  talk_competition#show
#                                              PATCH  /talk_competition/:id(.:format)                                                                  talk_competition#update
#                                              PUT    /talk_competition/:id(.:format)                                                                  talk_competition#update
#                                              DELETE /talk_competition/:id(.:format)                                                                  talk_competition#destroy
#
# Routes for Apitome::Engine:
#   root GET  /                         apitome/docs#index
#        GET  /simulate/*path(.:format) apitome/docs#simulate
#        GET  /*path(.:format)          apitome/docs#show
#
# Routes for PdfjsViewer::Rails::Engine:
# minimal GET  /minimal(.:format) pdfjs_viewer/viewer#minimal
#    full GET  /full(.:format)    pdfjs_viewer/viewer#full
#
