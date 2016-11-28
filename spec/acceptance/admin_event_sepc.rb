require 'acceptance_helper'

resource " '后台管理' 网站内容的操作" do
  header "Accept", "application/json"

  describe 'event condition is all correct' do
    admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
      @events = create_list(:event, 1, classify: "headline")
    end

  end

  #################### create #############################
  post '/admin/events' do
  	event_attrs = FactoryGirl.attributes_for(:event)
  	admin_attrs = FactoryGirl.attributes_for(:admin)

    header "X-Admin-Token", admin_attrs[:authentication_token]
    header "X-Admin-Email", admin_attrs[:email]

    before do
      @admin = create(:admin)
    end

  	parameter :title, "网站title",required: true, scope: :event
    parameter :classify, "网站分类:(bulletin: 1, headline: 2, 
                                  activity: 3, work: 4, intro: 5, contact: 
                                  6, teaching: 7)",required: true, scope: :event
    parameter :content, "网站内容",required: true, scope: :event
    parameter :picture_url, "网站picture_url",required: true, scope: :event
    parameter :is_competition, "判断是否是比赛 网站:(true, false)",required: true, scope: :event
   
    let(:title) {event_attrs[:title]}
    let(:classify) {event_attrs[:classify]}
    let(:content) {event_attrs[:content]}
    let(:picture_url) {event_attrs[:picture_url]}
    let(:is_competition) {event_attrs[:is_competition]}

    example "查询 网站内容 的列表成功" do
      do_request
      puts response_body
      expect(status).to eq(201)
    end
  end

  #################### index #############################
  get '/admin/events' do
  	
  	before do
  	  @events = create_list(:event, 1, classify: "headline")
  	end

  	parameter :page, "当前页", required: false
  	parameter :per_page, "每页的数量", required: false
   
    let(:page) {1}
    let(:per_page) {15}

    example "查询 网站内容 的列表成功" do
      do_request
      puts response_body
      expect(status).to eq(200)
    end
  end

  ##################### show #############################
  get "/admin/events/:id" do
  	before do
  	  @events = create_list(:event, 5, classify: "headline")	
  	end

  	let(:id) {@events.first.id}

  	example "查询 网站内容 的详情成功" do
  	  do_request
  	  puts response_body
  	  expect(status).to eq(200)
  	end
  end

  #  #################### index #############################
  # get '/admin/events' do
  	
  # 	before do
  # 	  @events = create_list(:event, 1, classify: "headline")
  # 	end

  # 	parameter :page, "当前页", required: false
  # 	parameter :per_page, "每页的数量", required: false
   
  #   let(:page) {1}
  #   let(:per_page) {15}

  #   example "查询 网站内容 的列表成功" do
  #     do_request
  #     puts response_body
  #     expect(status).to eq(200)
  #   end
  # end

  # ##################### show #############################
  # get "/admin/events/:id" do
  # 	before do
  # 	  @events = create_list(:event, 5, classify: "headline")	
  # 	end

  # 	let(:id) {@events.first.id}

  # 	example "查询 网站内容 的详情成功" do
  # 	  do_request
  # 	  puts response_body
  # 	  expect(status).to eq(200)
  # 	end
  # end
end