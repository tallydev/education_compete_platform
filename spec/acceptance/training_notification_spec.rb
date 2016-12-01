require 'acceptance_helper'

resource "学员 对 培训通知 内容的相关的API" do
  header "Accept", "application/json"

  ############### before_do ################################
  describe 'training_notification condition is all correct' do
    # admin_attrs = FactoryGirl.attributes_for(:admin)

    # header "X-Admin-Token", admin_attrs[:authentication_token]
    # header "X-Admin-Email", admin_attrs[:email]

    before do
      @training_notifications = create_list(:training_notification, 5, category: "teacher")
    end

    #################### index #############################
    get '/training_notifications' do
      parameter :category, "输入要查询的分类参数：(country: '国培培训' 0,
	                                          teacher: '骨干教师培训' 1,
	  										  manager: '专业负责人培训' 2),默认为‘0’,输入的参数为数字 ", required: false
   
      let(:category) {'1'}

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "学员 查询 培训通知信息 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/training_notifications/:id" do

  	  let(:id) {@training_notifications.first.id}

  	  example " 学员 查询指定 培训通知信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end