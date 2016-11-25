require 'acceptance_helper'

resource "资源库 / 目录内容" do
  header "Accept", "application/json"

  ######################### upload ###############################
  post '/resource_libraries' do
    # user_attrs = FactoryGirl.attributes_for(:user)
    resource_library_attrs = FactoryGirl.attributes_for(:resource_library)
    image_attrs = FactoryGirl.attributes_for(:image, photo_type: "picture")

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    # before do
      # @user = create(:user)
    # end

    parameter :title, "标题", required: true, scope: :resource_library
    parameter :catalog, "目录", required: true, scope: :resource_library
    parameter :picture_attributes, "目录内容,对应内容的参数如：(video_attributes: ‘视频‘,
                                    document_attributes: ‘文档‘,
                                    form_attributes: ‘表格‘,
                                    courseware_attributes: ‘课件‘,
                                    picture_attributes: ‘图片‘,
                                    audio_attributes: ‘音频‘)",
                            required: true, scope: :resource_library

    let(:title) {resource_library_attrs[:title]}
    let(:catalog) {resource_library_attrs[:catalog]}
    let(:picture_attributes) { image_attrs }

    example "上传 资源库 ‘目录内容’成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  ######################### index ###############################
  get '/resource_libraries' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      # @user = create(:user)
      @resource_libraries = create_list(:resource_library, 5, catalog: "picture")
      create_list(:image, 5, imageable_type:@resource_libraries.first)
    end

    parameter :number, "输入目录number, 用于返回对于目录的内容，(video: 1, document: 2, form: 3,
                        courseware: 4, picture: 5, audio: 6), 默认返回'video'的内容", required: false

    let(:number) { 5 }

    parameter :page, "当前页", required: false
    parameter :per_page, "每页的数量", required: false

    let(:page) {2}
    let(:per_page) {2}

    example "查列 资源库 ‘目录内容’ 列表成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

  ######################### show ###############################
  get '/resource_libraries/:id' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      # @user = create(:user)
      @resource_libraries = create_list(:resource_library, 5, catalog: "picture")
      create_list(:image, 5, imageable_type:@resource_libraries.first)
    end

    let(:id) {@resource_libraries.first.id}

    example "查看资源库 ‘目录内容’详情成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end
 
  ######################### download ###############################
  get '/resource_libraries/:id/download' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      # @user = create(:user)
      @resource_libraries = create_list(:resource_library, 5, catalog: "picture")
      # create(:image, 3, imageable_type:@resource_libraries.first)
    end

    let(:id) {@resource_libraries.first.id}

    example "下载 资源库 ‘目录内容’ 成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

  ######################### delete ###############################
  delete '/resource_libraries/:id' do
    # user_attrs = FactoryGirl.attributes_for(:user)

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    before do
      # @user = create(:user)
      @resource_libraries = create_list(:resource_library, 5, catalog: "picture")
    end

    let(:id) {@resource_libraries.first.id}

    example "删除 资源库 ‘目录内容’ 成功" do
      do_request
      puts response_body
      expect(status).to eq(204)
    end
  end
end