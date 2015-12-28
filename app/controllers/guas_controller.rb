class GuasController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    
    def index
        @guas = Gua.order("guas.serial ASC").all
    end
    
    def home
        @pluckyao = Yao.find_by(id: shuffle_yao)
        @pluckyao_name = @pluckyao.name
        @pluckyao_ytext = @pluckyao.ytext
        @pluckyao_gua = @pluckyao.gua
        @pluckyao_explain = @pluckyao.explain
    end
    
    def guaorder
        @guas = Gua.order("guas.serial ASC").all
        @gua1 = Gua.find_by(serial: 1)
    end
    
    def new
        @gua = Gua.new
    end
    
    def create
        @gua = Gua.new(gua_params)
        if @gua.save
            flash[:success] = 'Created gua successfully!'
            redirect_to guas_path
        else
            render 'new'
        end
    end
    
    def show
        @gua = Gua.find(params[:id])
        @gua_yaos = @gua.yaos.order('yaos.serial DESC').all
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
        params.require(:gua).permit(:name, :gtext, :explain, :explain2, :serial, :image)
    end
    
    def shuffle_gua
        Gua.pluck.shuffle[0][0]
    end
    
    def shuffle_yao
        Yao.pluck.shuffle[0][0]
    end
    
end