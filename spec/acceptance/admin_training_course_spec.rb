require 'acceptance_helper'

resource "管理员 对 培训课程 内容的相关的API" do
  header "Accept", "application/json"

  # #################### create #############################
  # post '/admin/training_courses' do
  #   admin_attrs = FactoryGirl.attributes_for(:admin)
  #   training_course_attrs = FactoryGirl.attributes_for(:training_course)

  #   header "X-Admin-Token", admin_attrs[:authentication_token]
  #   header "X-Admin-Email", admin_attrs[:email]

  #   before do
  #     @admin = create(:admin)
  #     @school = create(:school)
  #   end

  #   example "管理员 查询 培训课程信息 的列表成功" do
  #     do_request
  #     puts response_body
  #     expect(status).to eq(201)
  #   end
  # end

  ############### before_do ################################
  describe 'training_course condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin) #登录
      @school = create(:school)
      @training_courses = create_list(:training_course, 5, school: @school)#创建通过专家审核的
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

    # ##################### update #############################
    # put "/admin/training_courses/:id" do

  	 #  let(:id) {@training_courses.first.id}

  	 #  example " 管理员 查询指定 培训课程信息 的详情成功" do
  	 #    do_request
  	 #    puts response_body
  	 #    expect(status).to eq(201)
  	 #  end
    # end

    ##################### unchecked #############################
    post "/admin/training_courses/:id/unchecked" do

  	  let(:id) {@training_courses.first.id}

  	  example " 培训课程 未通过审核 的操作 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end

    ##################### checked_by_expert 专家审核 ###############
    post "/admin/training_courses/:id/checked_by_expert" do

      before do #创建未通过审核的
      	@unchecked_training_courses = create_list(:training_course, 5, school: @school, state: "unchecked")
      end

  	  let(:id) {@unchecked_training_courses.first.id}

  	  example " 培训课程 专家审核 的操作 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end

    ##################### checked_by_seminar 研究会审核 ################
    post "/admin/training_courses/:id/checked_by_seminar" do

  	  let(:id) {@training_courses.first.id}

  	  example " 培训课程 研究会审核 的操作 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end

    ##################### checked_by_educator 教委审核 #################
    post "/admin/training_courses/:id/checked_by_educator" do

      before do#创建研究会审核的
      	@seminar_training_courses = create_list(:training_course, 5, school: @school, state: "checked_by_seminar")
      end

  	  let(:id) {@seminar_training_courses.first.id}

  	  example " 培训课程 教委审核 的操作 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end
  end
end