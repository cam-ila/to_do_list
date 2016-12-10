class TemporaryTasksController < ApplicationController
  before_action :set_temporary_task, only: [:show, :edit, :update, :destroy]


  def index
    @temporary_tasks = TemporaryTask.all
  end

  def show
  end

  def new
    @temporary_task = TemporaryTask.new
  end

  def edit
  end

  def create
    @temporary_task = TemporaryTask.new(temporary_task_params)
    @temporary_task.list = List.find_by(:url => params['list_id']) #VER

    check_date (@temporary_task)

    if @temporary_task.save
      redirect_to list_path(@temporary_task.list), notice: 'Temporary task was successfully created.'
    else
      format.html { render :new }
    end
  end

  def update
    if @temporary_task.update(temporary_task_params)
      check_date(@temporary_task)
      @temporary_task.save
      redirect_to list_path(@temporary_task.list), notice: 'Temporary task was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @temporary_task.destroy
    redirect_to list_path(@temporary_task.list), notice: 'Temporary task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temporary_task
      @temporary_task = TemporaryTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temporary_task_params
      params.require(:temporary_task).permit(:description, :state, :priority, :start, :finish, :type, :list_id)
    end

    def check_date(task)
      if task.start > task.finish
        finish = task.finish
        task.finish = task.start
        task.start = finish  
      end
    end
end
