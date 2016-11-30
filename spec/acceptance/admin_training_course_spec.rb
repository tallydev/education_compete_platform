require 'acceptance_helper'

resource "管理员 对 培训课程 内容的相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/admin/training_courses' do
    admin_attrs = FactoryGirl.attributes_for(:admin)
    training_course_attrs = FactoryGirl.attributes_for(:training_course)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @school = create(:school)
    end

    parameter :name, "名称",required: true, scope: :start_time
    parameter :code, "编号:",required: true, scope: :training_course
    parameter :start_time, "开始时间",required: true, scope: :training_course
    parameter :end_time, "结束时间",required: true, scope: :training_course
    parameter :plan_number, "计划人数",required: true, scope: :training_course   
    parameter :grade_leader, "年级领导",required: true, scope: :training_course
    parameter :training_agency, "培训机构:)",required: true, scope: :training_course
    parameter :training_address, "培训地址",required: true, scope: :training_course
    parameter :training_fee, "培训费用",required: true, scope: :training_course
    parameter :remark, "备注",required: true, scope: :training_course
    parameter :info, "项目信息",required: true, scope: :training_course
    parameter :training_backgrounds, "培训机构背景:",required: true, scope: :training_course
    parameter :training_target, "培训目标",required: true, scope: :training_course
    parameter :training_content, "培训内容",required: true, scope: :training_course
    parameter :check_method, "考核方法",required: true, scope: :training_course
    parameter :project_leader, "项目负责人",required: true, scope: :training_course
    parameter :contact, "grade_leader:)",required: true, scope: :training_course
    parameter :school_id, "教师团队",required: true, scope: :training_course
    parameter :category, "培训分类，(country: '国培培训',
	  							     teacher: '骨干教师培训',
	  							     manager: '专业负责人培训')",required: true, scope: :training_course
    parameter :notification_id, "grade_leader",required: true, scope: :training_course
    parameter :start_apply_time, "报名开始时间",required: true, scope: :training_course
    parameter :end_apply_time, "报名结束时间:",required: true, scope: :training_course
    parameter :admin_id, "grade_leader",required: true, scope: :training_course
    parameter :linkman, "联系人",required: true, scope: :training_course
    parameter :phone, "手机号",required: true, scope: :training_course
    parameter :fax, "传真",required: true, scope: :training_course
    parameter :mobile, "联系电话",required: true, scope: :training_course
    parameter :email, "邮箱",required: true, scope: :training_course

    let(:name) {training_course_attrs[:name]}
    let(:code) {training_course_attrs[:code]}
    let(:start_time) {training_course_attrs[:start_time]}
    let(:end_time) {training_course_attrs[:end_time]}
    let(:plan_number) {training_course_attrs[:plan_number]}  
    let(:grade_leader) {training_course_attrs[:grade_leader]}
    let(:training_agency) {training_course_attrs[:training_agency]}
    let(:training_address) {training_course_attrs[:training_address]}
    let(:training_fee) {training_course_attrs[:training_fee]}
    let(:remark) {training_course_attrs[:remark]} 
    let(:info) {training_course_attrs[:info]}
    let(:training_backgrounds) {training_course_attrs[:training_backgrounds]}
    let(:training_target) {training_course_attrs[:training_target]}
    let(:training_content) {training_course_attrs[:training_content]}
    let(:check_method) {training_course_attrs[:check_method]}
    let(:project_leader) {training_course_attrs[:project_leader]}
    let(:contact) {training_course_attrs[:contact]}
      # let(:school_id) {training_course_attrs[:school_id]}
    let(:category) {training_course_attrs[:category]}
    let(:notification_id) {training_course_attrs[:notification_id]}
    let(:start_apply_time) {training_course_attrs[:start_apply_time]}
    let(:end_apply_time) {training_course_attrs[:end_apply_time]}
    let(:admin_id) {training_course_attrs[:admin_id]}
    let(:linkman) {training_course_attrs[:linkman]}
    let(:phone) {training_course_attrs[:phone]}
    let(:fax) {training_course_attrs[:fax]}
    let(:mobile) {training_course_attrs[:mobile]}
    let(:email) {training_course_attrs[:email]}

    example "管理员 查询 培训课程信息 的列表成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

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

    ##################### update #############################
    put "/admin/training_courses/:id" do
      training_course_attrs = FactoryGirl.attributes_for(:training_course)

  	  let(:id) {@training_courses.first.id}
    
      parameter :name, "名称",required: true, scope: :start_time
      parameter :code, "编号:",required: true, scope: :training_course
      parameter :start_time, "开始时间",required: true, scope: :training_course
      parameter :end_time, "结束时间",required: true, scope: :training_course
      parameter :plan_number, "计划人数",required: true, scope: :training_course   
      parameter :grade_leader, "年级领导",required: true, scope: :training_course
      parameter :training_agency, "培训机构:)",required: true, scope: :training_course
      parameter :training_address, "培训地址",required: true, scope: :training_course
      parameter :training_fee, "培训费用",required: true, scope: :training_course
      parameter :remark, "备注",required: true, scope: :training_course
      parameter :info, "项目信息",required: true, scope: :training_course
      parameter :training_backgrounds, "培训机构背景:",required: true, scope: :training_course
      parameter :training_target, "培训目标",required: true, scope: :training_course
      parameter :training_content, "培训内容",required: true, scope: :training_course
      parameter :check_method, "考核方法",required: true, scope: :training_course
      parameter :project_leader, "项目负责人",required: true, scope: :training_course
      parameter :contact, "grade_leader:)",required: true, scope: :training_course
      parameter :school_id, "教师团队",required: true, scope: :training_course
      parameter :category, "培训分类，(country: '国培培训',
	  							     teacher: '骨干教师培训',
	  							     manager: '专业负责人培训')",required: true, scope: :training_course
      parameter :notification_id, "grade_leader",required: true, scope: :training_course
      parameter :start_apply_time, "报名开始时间",required: true, scope: :training_course
      parameter :end_apply_time, "报名结束时间:",required: true, scope: :training_course
      parameter :admin_id, "grade_leader",required: true, scope: :training_course
      parameter :linkman, "联系人",required: true, scope: :training_course
      parameter :phone, "手机号",required: true, scope: :training_course
      parameter :fax, "传真",required: true, scope: :training_course
      parameter :mobile, "联系电话",required: true, scope: :training_course
      parameter :email, "邮箱",required: true, scope: :training_course

      let(:name) {training_course_attrs[:name]}
      let(:code) {training_course_attrs[:code]}
      let(:start_time) {training_course_attrs[:start_time]}
      let(:end_time) {training_course_attrs[:end_time]}
      let(:plan_number) {training_course_attrs[:plan_number]}  
      let(:grade_leader) {training_course_attrs[:grade_leader]}
      let(:training_agency) {training_course_attrs[:training_agency]}
      let(:training_address) {training_course_attrs[:training_address]}
      let(:training_fee) {training_course_attrs[:training_fee]}
      let(:remark) {training_course_attrs[:remark]} 
      let(:info) {training_course_attrs[:info]}
      let(:training_backgrounds) {training_course_attrs[:training_backgrounds]}
      let(:training_target) {training_course_attrs[:training_target]}
      let(:training_content) {training_course_attrs[:training_content]}
      let(:check_method) {training_course_attrs[:check_method]}
      let(:project_leader) {training_course_attrs[:project_leader]}
      let(:contact) {training_course_attrs[:contact]}
      #   let(:school_id) {training_course_attrs[:school_id]}
      let(:category) {training_course_attrs[:category]}
      let(:notification_id) {training_course_attrs[:notification_id]}
      let(:start_apply_time) {training_course_attrs[:start_apply_time]}
      let(:end_apply_time) {training_course_attrs[:end_apply_time]}
      let(:admin_id) {training_course_attrs[:admin_id]}
      let(:linkman) {training_course_attrs[:linkman]}
      let(:phone) {training_course_attrs[:phone]}
      let(:fax) {training_course_attrs[:fax]}
      let(:mobile) {training_course_attrs[:mobile]}
      let(:email) {training_course_attrs[:email]}


  	  example " 管理员 修改指定 培训课程信息 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(201)
  	  end
    end

    #################### unchecked #############################
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