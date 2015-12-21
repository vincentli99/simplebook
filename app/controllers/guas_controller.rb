class GuasController < ApplicationController
    def index
        @guas = Gua.all
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
    
    private
    def gua_params
        params.require(:gua).permit(:name, :gtext, :explain, :serial)
    end
end