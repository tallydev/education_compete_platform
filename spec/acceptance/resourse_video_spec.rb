# require 'acceptance_helper'

# resource "资源库 / 视频" do
#   header "Accept", "application/json"

#   ######################### upload ###############################
#   get '/resourse/videos' do
#     # user_attrs = FactoryGirl.attributes_for(:user)
#     resourse_video_attrs = FactoryGirl.attributes_for(:resourse_video)
#     media_attrs = FactoryGirl.attributes_for(:media, media_type: "video")

#     # header "X-User-Token", user_attrs[:authentication_token]
#     # header "X-User-Phone", user_attrs[:phone]

#     before do
#       # @user = create(:user)
#     end

#     parameter :type, "视频类型", required: true, scope: :resourse_video
#     parameter :video_attributes, "视频", required: true, scope: :resourse_video

#     let(:type) {resourse_video_attrs[:type]}
#     let(:video_attributes) { media_attrs }

#     example "上传 资源库 ‘视频’成功" do
#       do_request
#       puts response_body
#       expect(status).to eq(201)
#     end
#   end

#   ######################### index ###############################
#   get '/resourse/videos' do
#     # user_attrs = FactoryGirl.attributes_for(:user)

#     # header "X-User-Token", user_attrs[:authentication_token]
#     # header "X-User-Phone", user_attrs[:phone]

#     before do
#       # @user = create(:user)
#       create_list(:resourse_video, 5,  type: "视频")
#     end

#     parameter :page, "当前页", require: false
#     parameter :per_page, "每页的数量", require: false

#     let(:page) {2}
#     let(:per_page) {2}

#     example "查列 资源库 ‘视频’ 列表成功" do
#       do_request
#       puts response_body
#       expect(status).to eq(200)
#     end
#   end

#   ######################### show ###############################
#   get 'resourse/videos/:id' do
#     # user_attrs = FactoryGirl.attributes_for(:user)

#     # header "X-User-Token", user_attrs[:authentication_token]
#     # header "X-User-Phone", user_attrs[:phone]

#     before do
#       # @user = create(:user)
#       @resourse_videos = create_list(:resourse_video, 5, type: "视频")
#     end

#     let(:id) {@resourse_videos.first.id}

#     example "查看资源库 ‘视频’详情成功" do
#       do_request
#       puts response_body
#       expect(status).to eq(200)
#     end
#   end
 
#   ######################### download ###############################
#   get 'resourse/videos/:id/download' do
#     # user_attrs = FactoryGirl.attributes_for(:user)

#     # header "X-User-Token", user_attrs[:authentication_token]
#     # header "X-User-Phone", user_attrs[:phone]

#     before do
#       # @user = create(:user)
#       @resourse_videos = create_list(:resourse_video, 5, type: "视频")
#     end

#     let(:id) {@resourse_videos.first.id}

#     example "下载 资源库 ‘视频’ 成功" do
#       do_request
#       puts response_body
#       expect(status).to eq(200)
#     end
#   end

#   ######################### delete ###############################
#   delete 'resourse/videos/:id' do
#     # user_attrs = FactoryGirl.attributes_for(:user)

#     # header "X-User-Token", user_attrs[:authentication_token]
#     # header "X-User-Phone", user_attrs[:phone]

#     before do
#       # @user = create(:user)
#       @resourse_videos = create_list(:resourse_video, 5, type: "视频")
#     end

#     let(:id) {@resourse_videos.first.id}

#     example "删除 资源库 ‘视频’ 成功" do
#       do_request
#       puts response_body
#       expect(status).to eq(201)
#     end
#   end
# end