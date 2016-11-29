require 'acceptance_helper'

resource " '后台管理' 班级负责人反馈 相关的操作" do
  header "Accept", "application/json"
  
  ############### before_do ################################
  describe 'event condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @manager = create(:manager)
      @training_course = create(:training_course)
      @manager_feedbacks = create_list(:manager_feedback, 5, manager: @manager, training_course: @training_course)
    end

    #################### index #############################
    get '/admin/manager_feedbacks' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’管理员‘ 查询 班级负责人反馈 内容 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/manager_feedbacks/:id" do

  	  let(:id) {@manager_feedbacks.first.id}

  	  example "’管理员‘ 查询指定 班级负责人反馈 内容 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end