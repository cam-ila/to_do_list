class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @list = List.new
    set_session
  end

  def edit
  end

  def create
    set_session
    @list = List.new(list_params)
    if @list.save
      session[:current_user_id] << @list.name
      redirect_to action: "show", id: @list
    else
 
     render :new
    end

  end

  def update
      if @list.update(list_params)
       redirect_to @list, notice: 'La Lista fue actualiza exitosamente'
      else
        render :edit
      end
  end

  def destroy
    set_session
    @list.destroy
    session[:current_user_id].delete @list.url
    redirect_to root_path, notice: 'La Lista fue eliminada exitosamente' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(url: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :url, :created_at, :updated_at)
    end

    def set_session
      @lists = session[:current_user_id] ||= Array.new 
    end
end
