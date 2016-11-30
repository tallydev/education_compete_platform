require 'acceptance_helper'

resource " '后台管理' 学员反馈 相关的操作" do
  header "Accept", "application/json"
  
  ############### before_do ################################
  describe 'event condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @player = create(:player)
      # @training_course = create(:training_course)
      @player_feedbacks = create_list(:player_feedback, 5, player: @player)
    end

    #################### index #############################
    get '/admin/player_feedbacks' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’管理员‘ 查询 学员反馈 内容 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/player_feedbacks/:id" do

  	  let(:id) {@player_feedbacks.first.id}

  	  example "’管理员‘ 查询指定 学员反馈 内容 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end