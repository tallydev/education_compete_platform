require 'acceptance_helper'

resource "管理员 对 培训通知 内容相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/admin/training_notifications' do
    admin_attrs = FactoryGirl.attributes_for(:admin)
    training_notification_attrs = FactoryGirl.attributes_for(:training_notification)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]
    
    parameter :title, "培训通知的 标题",required: true, scope: :training_notification
    parameter :sub_title, "培训通知的：副标题",required: true, scope: :training_notification
    parameter :author, "培训通知的：作者",required: true, scope: :training_notification
    parameter :content, "培训通知的：内容",required: true, scope: :training_notification
    parameter :category, "培训分类，(country: '国培培训',
	  							   teacher: '骨干教师培训',
	  							   manager: '专业负责人培训')",required: true, scope: :training_notification
   
    let(:title) {training_notification_attrs[:title]}
    let(:sub_title) {training_notification_attrs[:sub_title]}
    let(:author) {training_notification_attrs[:author]}
    let(:content) {training_notification_attrs[:content]}
    let(:category) {training_notification_attrs[:category]}


    before do
      @admin = create(:admin)
    end

    example "管理员 创建 培训通知信息 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'admin_training_notification condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @training_notifications = create_list(:training_notification, 5, category: "teacher")
    end

    #################### index #############################
    get '/admin/training_notifications' do
      parameter :keyword, "输入要查询的参数：(培训通知名称 title or  培训通知作者author)，默认返回all", required: false
   
      let(:keyword) { }

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "管理员 查询 培训通知信息 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/training_notifications/:id" do

  	  let(:id) {@training_notifications.first.id}

  	  example " 管理员 查询指定 培训通知信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end


    ##################### update #############################
    put "/admin/training_notifications/:id" do

  	  let(:id) {@training_notifications.first.id}

  	  training_notification_attrs = FactoryGirl.attributes_for(:training_notification)
    
      parameter :title, "培训通知的 标题",required: true, scope: :training_notification
      parameter :sub_title, "培训通知的：副标题",required: true, scope: :training_notification
      parameter :author, "培训通知的：作者",required: true, scope: :training_notification
      parameter :content, "培训通知的：内容",required: true, scope: :training_notification
      parameter :category, "培训分类，(country: '国培培训',
	  							   teacher: '骨干教师培训',
	  							   manager: '专业负责人培训')",required: true, scope: :training_notification
   
      let(:title) {training_notification_attrs[:title]}
      let(:sub_title) {training_notification_attrs[:sub_title]}
      let(:author) {training_notification_attrs[:author]}
      let(:content) {training_notification_attrs[:content]}
      let(:category) {training_notification_attrs[:category]}

  	  example " 管理员 修改指定 培训通知信息 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end
  end
end