require 'acceptance_helper'

resource "学员评师 操作相关API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/appraises' do
  	appraise_attrs = FactoryGirl.attributes_for(:appraise)
  	player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      @training_course = create(:training_course)
    end

  	parameter :player_id, "评师的学员",required: true, scope: :appraise
    parameter :training_course_id, "学员评师的 training_course",required: true, scope: :appraise
    parameter :teacher_id, "学员评师的：teacher",required: true, scope: :appraise
    parameter :remark, "学员评师的：remark",required: true, scope: :appraise
    parameter :degree, "学员评师的：满意程度 ‘分五星’",required: true, scope: :appraise
   
    let(:player_id) {appraise_attrs[:player_id]}
    let(:training_course_id) {appraise_attrs[:training_course_id]}
    let(:teacher_id) {appraise_attrs[:teacher_id]}
    let(:remark) {appraise_attrs[:remark]}
    let(:degree) {appraise_attrs[:degree]}

    example "’学员‘创建 评师内容 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'appraise condition is all correct' do
    player_attrs = FactoryGirl.attributes_for(:player)

    header "X-Player-Token", player_attrs[:authentication_token]
    header "X-Player-Phone", player_attrs[:phone]

    before do
      @player = create(:player)
      @training_course = create(:training_course)
      @appraises = create_list(:appraise, 5, player: @player, training_course: @training_course)
    end

    #################### index #############################
    get '/appraises' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’学员‘ 查询 自己的评师内容 列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/appraises/:id" do

  	  let(:id) {@appraises.first.id}

  	  example "’学员‘ 查询指定 评师内容 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  
  end
end