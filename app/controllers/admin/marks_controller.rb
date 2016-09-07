class Admin::MarksController < Admin::BaseController
	before_action :set_activity, only: [:index, :bind_new, :new, :create]
	respond_to :html, :js

	def index
		@recruits = @activity.project_recruits(params[:project]).avg_mark_desc
		respond_to do |format|
        format.xls {
            send_data( xls_content_for(@recruits),
                :type => "text/excel;charset=utf-8; header=present",
                :filename => "#{@activity.name}.xls" )
        }
        format.html
    end
	end

	# 分配一个报名的评委专家
	def new
		@selected_recruits = [params[:recruit_id]]
		@distributed_experts = @activity.recruits.find(params[:recruit_id]).experts.pluck(:id)
    @experts = Expert.all
    respond_with @selected_recruits
	end

	# 分配多个报名的评委专家 || 分配比赛
	def bind_new
		@selected_recruits = params[:selected_recruits]
		@distributed_experts = []
    @experts = Expert.all

		if @selected_recruits.present?
			respond_with @selected_recruits
		else
			respond_to do |format|
				format.js { render js: "location.href = '/admin/activities/#{@activity.id}/#{@activity.route_type}'" }
			end
		end
	end

	# 给报名者（数组）分配评审专家
	def create
		# 要分配专家的报名人员
		if params[:recruit_experts]
			@activity_recruits = @activity.recruits.where(id: params[:selected_recruits])
			# 创建
			Mark.distribute_expert(@activity_recruits, params[:recruit_experts])
		else
			flash.now[:danger] = "请选择评委专家"
		end
		redirect_to "/admin/activities/#{@activity.id}/#{@activity.route_type}"
	end

	private
		def set_activity
			@activity = Activity.find(params[:activity_id])
		end

		def xls_content_for(objs)
      xls_report = StringIO.new
      book = Spreadsheet::Workbook.new
      sheet1 = book.create_worksheet :name => "成绩统计"

      blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10
      sheet1.row(0).default_format = blue

      sheet1.row(0).concat %w{排名 平均分 评委人数 姓名 院校 作品名称 评委评分}
      count_row = 1
      objs.each_with_index do |obj, index|
        sheet1[count_row, 0] = index+1
        sheet1[count_row, 1] = obj.avg_score
        sheet1[count_row, 2] = obj.score_count
        sheet1[count_row, 3] = obj.try(:player_info).try(:name)
        sheet1[count_row, 4] = obj.try(:school).try(:name)
        sheet1[count_row, 5] = obj.name
        obj.score_marks.each_with_index do |mark,index|
        	sheet1[count_row, index+6] = "#{mark.expert.phone.present? ? "评委#{index+1}" : ''} : #{mark.score.present? ? mark.score : 0}分"
        end      
        count_row += 1
      end

      book.write xls_report
      xls_report.string
    end

end
