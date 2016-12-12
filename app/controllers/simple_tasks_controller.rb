class SimpleTasksController < ApplicationController
  before_action :set_simple_task, only: [:show, :edit, :update, :destroy]

  def index
    @simple_tasks = SimpleTask.all
  end

  def show
  end

  def new
    @simple_task = SimpleTask.new
  end

  def edit
  end


  def create
    @simple_task = SimpleTask.new(simple_task_params)
    @simple_task.list = List.find_by(:url => params['list_id']) #VER


    respond_to do |format|
      if @simple_task.save
        format.html { redirect_to list_path(@simple_task.list), notice: 'Se creó exitosamente la tarea.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @simple_task.update(simple_task_params)
        format.html { redirect_to list_path(@simple_task.list), notice: 'Se actualizó exitosamente la tarea.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @simple_task.destroy
    respond_to do |format|
      format.html { redirect_to list_path(@simple_task.list), notice: 'Se eliminó exitosamente la tarea.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simple_task
      @simple_task = SimpleTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simple_task_params
      params.require(:simple_task).permit(:description, :state, :priority, :type, :list_id)
    end
end
