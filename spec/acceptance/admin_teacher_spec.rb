require 'acceptance_helper'

resource " ’管理员‘ 对 ‘项目老师’ 内容的相关的API" do
  header "Accept", "application/json"

  #################### create #############################
  post '/admin/teachers' do
  	admin_attrs = FactoryGirl.attributes_for(:admin)
    teacher_attrs = FactoryGirl.attributes_for(:teacher)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @school = create(:school)
    end

  	parameter :name, "老师姓名：（必填）",required: true, scope: :teacher
    parameter :id_card, "老师编号：（必填）",required: true, scope: :teacher
    parameter :position, "老师职位：（必填）",required: true, scope: :teacher
    parameter :school_id, "老师属于的学校：（必填）",required: true, scope: :teacher
    parameter :sex, "老师性别：（必填）",required: true, scope: :teacher
    parameter :remark, "老师职位：",required: true, scope: :teacher
    parameter :address, "老师address",required: true, scope: :teacher
    parameter :mobile, "老师mobile：（必填）",required: true, scope: :teacher
    parameter :phone, "老师phone：（必填）",required: true, scope: :teacher
    parameter :qq, "老师qq：",required: true, scope: :teacher
    parameter :email, "老师email：（必填）",required: true, scope: :teacher
    parameter :postcode, "老师postcode：",required: true, scope: :teacher
    parameter :job_title, "老师job_title：",required: true, scope: :teacher  

    let(:name) {teacher_attrs[:name]}
    let(:id_card) {teacher_attrs[:id_card]}
    let(:position) {teacher_attrs[:position]}
    let(:sex) {teacher_attrs[:sex]}
    let(:remark) {teacher_attrs[:remark]}
    let(:address) {teacher_attrs[:address]}
    let(:mobile) {teacher_attrs[:mobile]}
    let(:phone) {teacher_attrs[:phone]}
    let(:qq) {teacher_attrs[:qq]}
    let(:email) {teacher_attrs[:email]}
    let(:postcode) {teacher_attrs[:postcode]}
    let(:job_title) {teacher_attrs[:job_title]}
    let(:school_id) {teacher_attrs[:school_id]}

    example " ’管理员‘ 创建 项目老师信息 成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ############### before_do ################################
  describe 'teacher condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @school = create(:school)
      @teachers = create_list(:teacher, 5, school: @school)
    end

    #################### index #############################
    get '/admin/teachers' do

  	  parameter :page, "当前页", required: false
  	  parameter :per_page, "每页的数量", required: false
   
      let(:page) {1}
      let(:per_page) {15}

      example "’管理员‘ 查询 项目老师信息 的列表成功" do
        do_request
        puts response_body
        expect(status).to eq(200)
      end
    end

    ##################### show #############################
    get "/admin/teachers/:id" do

  	  let(:id) {@teachers.first.id}

  	  example "’管理员‘ 查询指定 项目老师信息 的详情成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(200)
  	  end
    end

    #################### update #############################
    put "/admin/teachers/:id" do
      teacher_attrs = FactoryGirl.attributes_for(:teacher)

      parameter :name, "老师姓名：（必填）",required: true, scope: :teacher
      parameter :id_card, "老师编号：（必填）",required: true, scope: :teacher
      parameter :position, "老师职位：（必填）",required: true, scope: :teacher
      parameter :school_id, "老师属于的学校：（必填）",required: true, scope: :teacher
      parameter :sex, "老师性别：（必填）",required: true, scope: :teacher
      parameter :remark, "老师职位：",required: true, scope: :teacher
      parameter :address, "老师address",required: true, scope: :teacher
      parameter :mobile, "老师mobile：（必填）",required: true, scope: :teacher
      parameter :phone, "老师phone：（必填）",required: true, scope: :teacher
      parameter :qq, "老师qq：",required: true, scope: :teacher
      parameter :email, "老师email：（必填）",required: true, scope: :teacher
      parameter :postcode, "老师postcode：",required: true, scope: :teacher
      parameter :job_title, "老师job_title：",required: true, scope: :teacher

      let(:id) {@teachers.first.id}
   
      let(:name) {teacher_attrs[:name]}
      let(:id_card) {teacher_attrs[:id_card]}
      let(:position) {teacher_attrs[:position]}
      let(:sex) {teacher_attrs[:sex]}
      let(:remark) {teacher_attrs[:remark]}
      let(:address) {teacher_attrs[:address]}
      let(:mobile) {teacher_attrs[:mobile]}
      let(:phone) {teacher_attrs[:phone]}
      let(:qq) {teacher_attrs[:qq]}
      let(:email) {teacher_attrs[:email]}
      let(:postcode) {teacher_attrs[:postcode]}
      let(:job_title) {teacher_attrs[:job_title]}
      let(:school_id) {teacher_attrs[:school_id]}

  	  example "’管理员‘ 修改指定 项目老师信息 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(204)
  	  end
    end

    ##################### delete #############################
    delete "/admin/teachers/:id" do
  	  let(:id) {@teachers.first.id}

  	  example "’管理员‘ 删除指定 项目老师信息 成功" do
  	    do_request
  	    puts response_body
  	    expect(status).to eq(204)
  	  end
    end
  end
end