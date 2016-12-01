require 'acceptance_helper'

resource "学员报名 操作相关API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/player_training_courses' do
  	player_training_course_attrs = FactoryGirl.attributes_for(:player_training_course)
  	player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      # @training_course = create(:training_course)
    end

  	parameter :player_id, "报名的学员",required: true, scope: :player_training_course
    parameter :training_course_id, "报名的 课程",required: true, scope: :player_training_course
    parameter :remark, "备注",required: true, scope: :player_training_course
    parameter :certificate_no, "学员证书编号",required: true, scope: :player_training_course
   
    let(:player_id) {player_training_course_attrs[:player_id]}
    let(:training_course_id) {player_training_course_attrs[:training_course_id]}
    let(:remark) {player_training_course_attrs[:remark]}
    let(:certificate_no) {player_training_course_attrs[:certificate_no]}

    example "’学员‘创建 报名信息 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'player_training_course condition is all correct' do
    player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      # @training_course = create(:training_course)
      @player_training_courses = create_list(:player_training_course, 5, player: @player)
    end

    #################### index #############################
    get '/player_training_courses' do
    	
      example "’学员‘ 查询 报名信息 列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/player_training_courses/:id" do

  	  let(:id) {@player_training_courses.first.id}

  	  example "’学员‘ 查询 报名信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end