class ListsController < ApplicationController
	before_action :set_list, only: [:show, :edit, :update, :destroy]
	def index
	  @lists = List.all
	end

  	def show
  	end
	
	def new
    	@list = List.new
  	end

  	def edit
  	end

 
  	def create
	    @list = List.new(list_params)
	    @list.url = @list.name.parameterize
	    
	    respond_to do |format|
	      if @list.save
	        format.html { redirect_to @list, notice: 'List was successfully created.' }
	        format.json { render :show, status: :created, location: @list }
	      else
	        format.html { render :new }
	        format.json { render json: @list.errors, status: :unprocessable_entity }
	      end
	    end
  	end

   	def update
	end

	def destroy
  	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    #TODO: ver lo de task, es un parametro permitido??????????????????
    def list_params
      params.require(:list).permit(:name, :url, :type)
    end

end
