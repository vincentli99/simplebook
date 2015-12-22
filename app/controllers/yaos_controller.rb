class YaosController < ApplicationController
    before_action :set_gua, only: [:new, :create, :edit, :update, :destroy]
    
    def new
        @yao = Yao.new
    end
    
    def create
        @yao = Yao.new(params_yao)
        @yao.gua_id = @gua.id
        if @yao.save
            flash[:success] = "Yao created successfully!"
            redirect_to gua_path(@gua)
        else
            render 'new'
        end
    end
    
    def edit
        @yao = Yao.find(params[:id])
    end
    
    def update
        @yao = Yao.find(params[:id])
        if @yao.update(params_yao)
            flash[:success] = "Yao update successfully!"
            redirect_to gua_path(@gua)
        else
            render 'edit'
        end
    end
    
    def destroy
        @yao = Yao.find(params[:id])
        @yao.destroy
        flash[:success] = "Yao deleted successfully!"
        redirect_to gua_path(@gua)
    end
    
    def show
    end
    
    private
    def params_yao
        params.require(:yao).permit(:name, :ytext, :serial, :gua_id, :yingyang, :explain)
    end
    
    def set_gua
        @gua = Gua.find(params[:gua_id])
    end

   
end

 