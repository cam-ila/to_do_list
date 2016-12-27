class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @list = List.new
    fucking_cookie
  end

  def edit
  end

  def create
    @list = List.new(list_params)
   
    if @list.save
      set_cookie
      redirect_to action: "show", id: @list
    else
     fucking_cookie
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
    delete_cookie(@list.url)
    @list.destroy
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

    def set_cookie
      cookies['created_lists'].nil? ? cookies['created_lists'] = @list.url + "," : cookies['created_lists'] += @list.url + ","
    end
    
    def delete_cookie(url)
      @array_cookie = array_cookie(cookies['created_lists'])
      @array_cookie.delete(@list.url)
      cookies['created_lists'] = @array_cookie.join(",")

    end

    def array_cookie(lists)
      lists.split(",")
    end

    def fucking_cookie
      cookies['created_lists'] ||= ''
      @created_lists=array_cookie(cookies['created_lists'])
    end


end
