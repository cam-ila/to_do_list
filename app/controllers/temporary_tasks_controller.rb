class TemporaryTasksController < ApplicationController
  before_action :set_temporary_task, only: [:show, :edit, :update, :destroy]

  # GET /temporary_tasks
  # GET /temporary_tasks.json
  def index
    @temporary_tasks = TemporaryTask.all
  end

  # GET /temporary_tasks/1
  # GET /temporary_tasks/1.json
  def show
  end

  # GET /temporary_tasks/new
  def new
    @temporary_task = TemporaryTask.new
  end

  # GET /temporary_tasks/1/edit
  def edit
  end

  # POST /temporary_tasks
  # POST /temporary_tasks.json
  def create
    @temporary_task = TemporaryTask.new(temporary_task_params)

    respond_to do |format|
      if @temporary_task.save
        format.html { redirect_to list_path(@temporary_task.list), notice: 'Temporary task was successfully created.' }
        format.json { render :show, status: :created, location: @temporary_task }
      else
        format.html { render :new }
        format.json { render json: @temporary_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temporary_tasks/1
  # PATCH/PUT /temporary_tasks/1.json
  def update
    respond_to do |format|
      if @temporary_task.update(temporary_task_params)
        format.html { redirect_to list_path(@temporary_task.list), notice: 'Temporary task was successfully updated.' }
        format.json { render :show, status: :ok, location: @temporary_task }
      else
        format.html { render :edit }
        format.json { render json: @temporary_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporary_tasks/1
  # DELETE /temporary_tasks/1.json
  def destroy
    @temporary_task.destroy
    respond_to do |format|
      format.html { redirect_to temporary_tasks_url, notice: 'Temporary task was successfully destroyed.' }
      format.json { head :no_content }
    end
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
