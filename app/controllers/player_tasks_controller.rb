class PlayerTasksController < ApplicationController
  before_action :set_player_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @player_tasks = PlayerTask.all
    respond_with(@player_tasks)
  end

  def show
    respond_with(@player_task)
  end

  def new
    @player_task = PlayerTask.new
    respond_with(@player_task)
  end

  def edit
  end

  def create
    @player_task = PlayerTask.new(player_task_params)
    @player_task.save
    respond_with(@player_task)
  end

  def update
    @player_task.update(player_task_params)
    respond_with(@player_task)
  end

  def destroy
    @player_task.destroy
    respond_with(@player_task)
  end

  private
    def set_player_task
      @player_task = PlayerTask.find(params[:id])
    end

    def player_task_params
      params.require(:player_task).permit(:title, :content, :appraise, :task_id, :player_id)
    end
end
