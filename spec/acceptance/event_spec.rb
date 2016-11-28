require 'acceptance_helper'

resource "网站内容的操作" do
  header "Accept", "application/json"

  #################### index #############################
  get '/events' do
  	
  	before do
  	  @events = create_list(:event, 5, classify: "headline")
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
  get "/events/:id" do
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
end