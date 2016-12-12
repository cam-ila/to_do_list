class LongTasksController < ApplicationController
  before_action :set_long_task, only: [:show, :edit, :update, :destroy]


  def index
    @long_tasks = LongTask.all
  end

  
  def show
  end

  def new
    @long_task = LongTask.new
  end

  def edit
  end

  def create
    @long_task = LongTask.new(long_task_params)
    @long_task.list = List.find_by(:url => params['list_id']) #VER

    if @long_task.save
      redirect_to list_path(@long_task.list), notice: 'Long task was successfully created.'
    else
      render :new
    end
  end


  def update
    if @long_task.update(long_task_params)
      redirect_to list_path(@long_task.list), notice: 'Long task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @long_task.destroy
    redirect_to list_path(@long_task.list), notice: 'Long task was successfully destroyed.'
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_long_task
      @long_task = LongTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def long_task_params
      params.require(:long_task).permit(:description, :state, :priority, :progress, :type, :list_id)
    end
  end
