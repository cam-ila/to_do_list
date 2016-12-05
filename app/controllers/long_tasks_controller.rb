class LongTasksController < ApplicationController
  before_action :set_long_task, only: [:show, :edit, :update, :destroy]

  # GET /long_tasks
  # GET /long_tasks.json
  def index
    @long_tasks = LongTask.all
  end

  # GET /long_tasks/1
  # GET /long_tasks/1.json
  def show
  end

  # GET /long_tasks/new
  def new
    @long_task = LongTask.new
  end

  # GET /long_tasks/1/edit
  def edit
  end

  # POST /long_tasks
  # POST /long_tasks.json
  def create
    @long_task = LongTask.new(long_task_params)

    respond_to do |format|
      if @long_task.save
        format.html { redirect_to list_path(@long_task.list), notice: 'Long task was successfully created.' }
        format.json { render :show, status: :created, location: @long_task }
      else
        format.html { render :new }
        format.json { render json: @long_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /long_tasks/1
  # PATCH/PUT /long_tasks/1.json
  def update
    respond_to do |format|
      if @long_task.update(long_task_params)
        format.html { redirect_to list_path(@long_task.list), notice: 'Long task was successfully updated.' }
        format.json { render :show, status: :ok, location: @long_task }
      else
        format.html { render :edit }
        format.json { render json: @long_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /long_tasks/1
  # DELETE /long_tasks/1.json
  def destroy
    @long_task.destroy
    respond_to do |format|
      format.html { redirect_to long_tasks_url, notice: 'Long task was successfully destroyed.' }
      format.json { head :no_content }
    end
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
