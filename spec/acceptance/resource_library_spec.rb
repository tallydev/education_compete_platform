require 'acceptance_helper'

resource "资源库 / 目录内容" do
  header "Accept", "application/json"

  ######################### upload ###############################
  post '/resource_libraries' do
    # user_attrs = FactoryGirl.attributes_for(:user)
    resource_library_attrs = FactoryGirl.attributes_for(:resource_library)

    media_attrs = FactoryGirl.attributes_for(:media, media_type: "video")
    paper_attrs = FactoryGirl.attributes_for(:paper, paper_type: "document") 
    paper_attrs = FactoryGirl.attributes_for(:paper, paper_type: "form")
    paper_attrs = FactoryGirl.attributes_for(:paper, paper_type: "courseware")
    image_attrs = FactoryGirl.attributes_for(:image, photo_type: "picture")
    sound_attrs = FactoryGirl.attributes_for(:sound, sound_type: "audio")

    # header "X-User-Token", user_attrs[:authentication_token]
    # header "X-User-Phone", user_attrs[:phone]

    # before do
      # @user = create(:user)
    # end

    parameter :title, "标题", required: true, scope: :resource_library
    parameter :catalog, "目录: select(video: 1, document: 2, form: 3,
                        courseware: 4, picture: 5, audio: 6), 默认返回'video'", required: true, scope: :resource_library

    parameter :picture_attributes, "目录内容,对应内容的参数如：(video_attributes: ‘视频‘,
                                    document_attributes: ‘文档‘, form_attributes: ‘表格‘,
                                    courseware_attributes: ‘课件‘, picture_attributes: ‘图片‘,
                                    audio_attributes: ‘音频‘)", required: true, scope: :resource_library
    # parameter :document_attributes, "目录内容",required: true, scope: :resource_library
    # parameter :form_attributes, "目录内容",required: true, scope: :resource_library
    # parameter :courseware_attributes, "目录内容",required: true, scope: :resource_library
    # parameter :video_attributes, "目录内容",required: true, scope: :resource_library
    # parameter :audio_attributes, "目录内容",required: true, scope: :resource_library


    let(:title) {resource_library_attrs[:title]}
    let(:catalog) {resource_library_attrs[:catalog]}

    let(:picture_attributes) { image_attrs }
    # let(:document_attributes) { paper_attrs }
    # let(:form_attributes) { paper_attrs }
    # let(:courseware_attributes) { paper_attrs }
    # let(:video_attributes) { media_attrs }
    # let(:audio_attributes) { sound_attrs }

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
      @resource_libraries = create_list(:resource_library, 5, catalog: "video")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "document")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "form")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "courseware")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "picture")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "audio")

      create_list(:image, 5, imageable_type:@resource_libraries.first)
    end

    parameter :number, "输入目录number, 用于返回对于目录的内容，(video: 1, document: 2, form: 3,
                        courseware: 4, picture: 5, audio: 6), 默认返回'video'的内容", required: false

    let(:number) { 6 }

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
      @resource_libraries = create_list(:resource_library, 5, catalog: "video")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "document")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "form")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "courseware")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "picture")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "audio")

      create_list(:image, 5, imageable_type:@resource_libraries.first)
    end

    let(:id) {@resource_libraries.last.id}

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
      @resource_libraries = create_list(:resource_library, 5, catalog: "video")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "document")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "form")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "courseware")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "picture")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "audio")

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
      @resource_libraries = create_list(:resource_library, 5, catalog: "video")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "document")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "form")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "courseware")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "picture")
      @resource_libraries.concat create_list(:resource_library, 5, catalog: "audio")   
    end

    let(:id) {@resource_libraries.first.id}

    example "删除 资源库 ‘目录内容’ 成功" do
      do_request
      puts response_body
      expect(status).to eq(204)
    end
  end
end