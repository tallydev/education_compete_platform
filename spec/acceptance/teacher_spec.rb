require 'acceptance_helper'

resource "学员 对 项目老师 内容的相关的API" do
  header "Accept", "application/json"

  ############### before_do ################################
  describe 'teacher condition is all correct' do
    # admin_attrs = FactoryGirl.attributes_for(:admin)

    # header "X-Admin-Token", admin_attrs[:authentication_token]
    # header "X-Admin-Email", admin_attrs[:email]

    before do
      @school = create(:school)
      @teachers = create_list(:teacher, 5, school: @school)
    end

    #################### index #############################
    get '/teachers' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "学员 查询 项目老师信息 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/teachers/:id" do

  	  let(:id) {@teachers.first.id}

  	  example " 学员 查询指定 项目老师信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end
  end
end