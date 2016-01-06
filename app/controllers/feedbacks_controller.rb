class FeedbacksController < ApplicationController
    before_action :authenticate_user!, only: [:index, :destroy]
    
    def index
        @feedbacks = Feedback.all
    end
    
    def new
        @feedback = Feedback.new
    end
    
    def create
        @feedback = Feedback.new(feedback_params)
        respond_to do |format|
            if @feedback.save
                flash.now[:success] = "感謝您的意見！"
                format.js
            else
                format.html { render action: "new" }
                format.js 
            end
        end
    end
    
    def destroy
        @feedback = Feedback.find(params[:id])
        @feedback.destroy
        flash[:success] = "留言已刪除"
        redirect_to feedbacks_path
    end
    
    def show
        @feedback = Feedback.find(params[:id])
    end
    
    private
    def feedback_params
        params.require(:feedback).permit(:email, :opinion)
    end
end