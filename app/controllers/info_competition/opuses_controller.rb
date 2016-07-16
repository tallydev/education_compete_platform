class InfoCompetition::OpusesController < ApplicationController
  before_action :set_info_competition_opus, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @info_competition_opuses = InfoCompetition::Opus.all
    respond_with(@info_competition_opuses)
  end

  def show
    @recruit = @info_competition_opus.recruit
    @player_info = @recruit.player.info
    respond_with(@info_competition_opus)
  end

  # def new
  #   @info_competition_opus = InfoCompetition::Opus.new
  #   respond_with(@info_competition_opus)
  # end

  # def edit
  # end

  # def create
  #   @info_competition_opus = InfoCompetition::Opus.new(info_competition_opus_params)
  #   @info_competition_opus.save
  #   respond_with(@info_competition_opus)
  # end

  def new
    @first_opus = current_player.recruits.blank? ? nil : current_player.recruits.first
    @player = current_player.try(:info)

    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = @info_competition_recruit.build_opus
    respond_with(@info_competition_opus)
  end

  def edit
  end

  def create
    @info_competition_recruit = InfoCompetition::Recruit.find(params[:recruit_id])
    @info_competition_opus = @info_competition_recruit.build_opus(info_competition_opus_params)
    # @info_competition_opus.save

    @info_competition_opus.media = Media.new if @info_competition_opus.media.blank?
    @info_competition_opus.media.file = params[:info_competition_opus][:madia]

    @media = @info_competition_opus.build_media(media_params)

    if @info_competition_opus.save && @media.save
      respond_with(@info_competition_opus)
      p "============================="
    else
      return render action: :new
      p "++++++++++++++++++++++++++++++"
    end

    

    # @note = @info_competition_opus.build_note(note_params)
    # @note.save

    # @ppt = @info_competition_opus.build_ppt(ppt_params)
    # @ppt.save
  end

  def update
    @info_competition_opus.update(info_competition_opus_params)
    respond_with(@info_competition_opus)
  end

  def destroy
    @info_competition_opus.destroy
    respond_with(@info_competition_opus)
  end

  private
    def set_info_competition_opus
      @info_competition_opus = InfoCompetition::Opus.find(params[:id])
    end

    def info_competition_opus_params
      params.require(:info_competition_opus)
          .permit(:recruit_id)
    end

    def media_params
      params[:info_competition_opus][:media]
          .permit(:file)
      
    end
    def plan_params
      params[:info_competition_opus][:plan].permit(:file)
    end
    def note_params
      params[:info_competition_opus][:note].permit(:file)
    end
    def ppt_params
      params[:info_competition_opus][:ppt].permit(:file)
    end

end
