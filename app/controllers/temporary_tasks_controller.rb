class TemporaryTasksController < ApplicationController
  before_action :set_temporary_task, only: [:show, :edit, :update, :destroy]


  def new
    @temporary_task = TemporaryTask.new
  end

  def edit
  end

  def create
    @temporary_task = TemporaryTask.new(temporary_task_params)
    @temporary_task.list = List.find_by(:url => params['list_id']) #VER

    if @temporary_task.save
      redirect_to list_path(@temporary_task.list), notice: 'Se creó exitosamente la tarea.'
    else
      render :new 
    end
  end

  def update
    if @temporary_task.update(temporary_task_params)
      redirect_to list_path(@temporary_task.list), notice: 'Se actualizó exitosamente la tarea.' 
    else
      render :edit
    end
  end

  def destroy
    @temporary_task.destroy
    redirect_to list_path(@temporary_task.list), notice: 'Se eliminó exitosamente la tarea.'
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

end
