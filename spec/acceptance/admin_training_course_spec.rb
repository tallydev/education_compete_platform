require 'acceptance_helper'

resource "管理员 对 培训课程 内容的相关的API" do
  header "Accept", "application/json"

  ############### before_do ################################
  describe 'training_course condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @school = create(:school)
      @training_courses = create_list(:training_course, 5, school: @school)
    end

    #################### index #############################
    get '/admin/training_courses' do
      parameter :keyword, "输入要查询的参数：(培训课程名称 or 学校名称 or 培训课程编号code)，默认返回all", required: false
   
      let(:keyword) { }

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "管理员 查询 培训课程信息 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/training_courses/:id" do

  	  let(:id) {@training_courses.first.id}

  	  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end

    # ##################### show #############################
    # get "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end

    # ##################### show #############################
    # get "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end

    # ##################### show #############################
    # get "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end

    # ##################### show #############################
    # get "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end

    # ##################### show #############################
    # get "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end
  end
end