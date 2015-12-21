class GuasController < ApplicationController
    def index
        @guas = Gua.order("guas.serial ASC").all
    end
    
    def new
        @gua = Gua.new
    end
    
    def create
        @gua = Gua.new(gua_params)
        if @gua.save
            flash[:success] = 'Created gua successfully!'
            redirect_to root_path
        else
            render 'new'
        end
    end
    
    def show
        @gua = Gua.find(params[:id])
    end
    
    def edit
        @gua = Gua.find(params[:id])
    end
    
    def update
        @gua = Gua.find(params[:id])
        if @gua.update(gua_params)
            flash[:success] = "Gua updated successfully!"
            redirect_to gua_path(@gua)
        else
            render 'edit'
        end
    end
    
    def destroy
        Gua.find(params[:id]).destroy
        flash[:success] = "Gua deleted successfully!"
        redirect_to guas_path
    end
    
    private
    def gua_params
        params.require(:gua).permit(:name, :gtext, :explain, :serial)
    end
end