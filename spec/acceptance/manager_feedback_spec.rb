require 'acceptance_helper'

resource "班级负责人反馈 操作相关API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/manager_feedbacks' do
  	manager_feedback_attrs = FactoryGirl.attributes_for(:manager_feedback)
  	manager_attrs = FactoryGirl.attributes_for(:manager)

    header "X-Manager-Token", manager_attrs[:authentication_token]
    header "X-Manager-Phone", manager_attrs[:phone]

    before do
      @manager = create(:manager)
      @training_course = create(:training_course)
    end

  	parameter :manager_id, "反馈的班级负责人",required: true, scope: :manager_feedback
    parameter :training_course_id, "班级负责人反馈的 课程",required: true, scope: :manager_feedback
    parameter :organizer, "班级负责人反馈的：organizer",required: true, scope: :manager_feedback
    parameter :total_hours, "班级负责人反馈的：total_hours",required: true, scope: :manager_feedback
    parameter :total_expenses, "班级负责人反馈的：total_expenses",required: true, scope: :manager_feedback
    parameter :total_expenses_info, "班级负责人反馈的：total_expenses_info",required: true, scope: :manager_feedback
    parameter :feedback, "班级负责人反馈的：feedback",required: true, scope: :manager_feedback
    parameter :remark, "班级负责人反馈的：remark",required: true, scope: :manager_feedback
   
    let(:manager_id) {manager_feedback_attrs[:manager_id]}
    let(:training_course_id) {manager_feedback_attrs[:training_course_id]}
    let(:organizer) {manager_feedback_attrs[:organizer]}
    let(:total_hours) {manager_feedback_attrs[:total_hours]}
    let(:total_expenses) {manager_feedback_attrs[:total_expenses]}
    let(:total_expenses_info) {manager_feedback_attrs[:total_expenses_info]}
    let(:feedback) {manager_feedback_attrs[:feedback]}
    let(:remark) {manager_feedback_attrs[:remark]}

    example "’班级负责人‘创建 反馈内容 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'manager_feedback condition is all correct' do
    manager_attrs = FactoryGirl.attributes_for(:manager)

    header "X-Manager-Token", manager_attrs[:authentication_token]
    header "X-Manager-Phone", manager_attrs[:phone]

    before do
      @manager = create(:manager)
      @training_course = create(:training_course)
      @manager_feedbacks = create_list(:manager_feedback, 5, manager: @manager, training_course: @training_course)
    end

    #################### index #############################
    get '/manager_feedbacks' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’班级负责人‘ 查询 自己的反馈内容 列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/manager_feedbacks/:id" do

  	  let(:id) {@manager_feedbacks.first.id}

  	  example "’班级负责人‘ 查询指定 反馈内容 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end

    #################### update #############################
    patch "/manager_feedbacks/:id" do
      manager_feedback_attrs = FactoryGirl.attributes_for(:manager_feedback)
  	  
  	  let(:id) {@manager_feedbacks.first.id}

  	  parameter :manager_id, "反馈的班级负责人",required: true, scope: :manager_feedback
      parameter :training_course_id, "班级负责人反馈的 课程",required: true, scope: :manager_feedback
      parameter :organizer, "班级负责人反馈的：organizer",required: true, scope: :manager_feedback
      parameter :total_hours, "班级负责人反馈的：total_hours",required: true, scope: :manager_feedback
      parameter :total_expenses, "班级负责人反馈的：total_expenses",required: true, scope: :manager_feedback
      parameter :total_expenses_info, "班级负责人反馈的：total_expenses_info",required: true, scope: :manager_feedback
      parameter :feedback, "班级负责人反馈的：feedback",required: true, scope: :manager_feedback
      parameter :remark, "班级负责人反馈的：remark",required: true, scope: :manager_feedback
       
      let(:manager_id) {manager_feedback_attrs[:manager_id]}
      let(:training_course_id) {manager_feedback_attrs[:training_course_id]}
      let(:organizer) {manager_feedback_attrs[:organizer]}
      let(:total_hours) {manager_feedback_attrs[:total_hours]}
      let(:total_expenses) {manager_feedback_attrs[:total_expenses]}
      let(:total_expenses_info) {manager_feedback_attrs[:total_expenses_info]}
      let(:feedback) {manager_feedback_attrs[:feedback]}
      let(:remark) {manager_feedback_attrs[:remark]}
      
  	  example "’班级负责人‘ 修改指定 反馈内容 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end

  end
end