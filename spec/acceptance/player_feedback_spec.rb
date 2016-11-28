require 'acceptance_helper'

resource "学员反馈 操作相关API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/player_feedbacks' do
  	player_feedback_attrs = FactoryGirl.attributes_for(:player_feedback)
  	player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      @training_course = create(:training_course)
    end

  	parameter :player_id, "反馈的学员",required: true, scope: :player_feedback
    parameter :training_course_id, "学员反馈的 课程",required: true, scope: :player_feedback
    parameter :teach, "学员反馈的：teach",required: true, scope: :player_feedback
    parameter :discussion, "学员反馈的：discussion",required: true, scope: :player_feedback
    parameter :visiting, "学员反馈的：visiting",required: true, scope: :player_feedback
    parameter :organization, "学员反馈的：organization",required: true, scope: :player_feedback
    parameter :study_life, "学员反馈的：study_life",required: true, scope: :player_feedback
    parameter :most_value, "学员反馈的：most_value",required: true, scope: :player_feedback
    parameter :most_gain, "学员反馈的：most_gain",required: true, scope: :player_feedback
    parameter :graduate_message, "学员反馈的:graduate_message",required: true, scope: :player_feedback
   
    let(:player_id) {player_feedback_attrs[:player_id]}
    let(:training_course_id) {player_feedback_attrs[:training_course_id]}
    let(:teach) {player_feedback_attrs[:teach]}
    let(:discussion) {player_feedback_attrs[:discussion]}
    let(:visiting) {player_feedback_attrs[:visiting]}
    let(:organization) {player_feedback_attrs[:organization]}
    let(:study_life) {player_feedback_attrs[:study_life]}
    let(:most_value) {player_feedback_attrs[:most_value]}
    let(:most_gain) {player_feedback_attrs[:most_gain]}
    let(:graduate_message) {player_feedback_attrs[:graduate_message]}

    example "’学员‘创建 反馈内容 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'player_feedback condition is all correct' do
    player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      @training_course = create(:training_course)
      @player_feedbacks = create_list(:player_feedback, 5, player: @player, training_course: @training_course)
    end

    #################### index #############################
    get '/player_feedbacks' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’学员‘ 查询 自己的反馈内容 列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/player_feedbacks/:id" do

  	  let(:id) {@player_feedbacks.first.id}

  	  example "’学员‘ 查询指定 反馈内容 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end

    #################### update #############################
    patch "/player_feedbacks/:id" do
      player_feedback_attrs = FactoryGirl.attributes_for(:player_feedback)
  	  
  	  let(:id) {@player_feedbacks.first.id}

  	  parameter :player_id, "反馈的学员",required: true, scope: :player_feedback
      parameter :training_course_id, "学员反馈的 课程",required: true, scope: :player_feedback
      parameter :teach, "学员反馈的：teach",required: true, scope: :player_feedback
      parameter :discussion, "学员反馈的：discussion",required: true, scope: :player_feedback
      parameter :visiting, "学员反馈的：visiting",required: true, scope: :player_feedback
      parameter :organization, "学员反馈的：organization",required: true, scope: :player_feedback
      parameter :study_life, "学员反馈的：study_life",required: true, scope: :player_feedback
      parameter :most_value, "学员反馈的：most_value",required: true, scope: :player_feedback
      parameter :most_gain, "学员反馈的：most_gain",required: true, scope: :player_feedback
      parameter :graduate_message, "学员反馈的:graduate_message",required: true, scope: :player_feedback
   
      let(:player_id) {player_feedback_attrs[:player_id]}
      let(:training_course_id) {player_feedback_attrs[:training_course_id]}
      let(:teach) {player_feedback_attrs[:teach]}
      let(:discussion) {player_feedback_attrs[:discussion]}
      let(:visiting) {player_feedback_attrs[:visiting]}
      let(:organization) {player_feedback_attrs[:organization]}
      let(:study_life) {player_feedback_attrs[:study_life]}
      let(:most_value) {player_feedback_attrs[:most_value]}
      let(:most_gain) {player_feedback_attrs[:most_gain]}
      let(:graduate_message) {player_feedback_attrs[:graduate_message]}

  	  example "’学员‘ 修改指定 反馈内容 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(204)
  	  end
    end

  end
end