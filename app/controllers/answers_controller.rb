class AnswersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_answer, only: [:edit, :show, :update, :destroy]
    before_action :set_doubt, only: [:edit, :show, :update, :destroy, :create]

    def create
        @answer = @doubt.create_answer(answer_params)
        @answer.user_id = current_user.id

        respond_to do |format|
            if @answer.save
                format.html {redirect_to doubt_path(@doubt)}
                format.js
            else
                format.html {redirect_to doubt_path(@doubt), notice: 'Answer did not save. Please try again'}
                format.js
            end
        end
    end

    def new
    end

    def destroy
        @answer = @doubt.answer
        @answer.destroy
        redirect_to doubt_path(@doubt)
    end

    def edit
        @doubt = Doubt.find(params[:doubt_id])
        @answer = @doubt.answer
    end

    def update
        @answer = @doubt.answer
        respond_to do |format|
            if @answer.update(answer_params)
                format.html {redirect_to doubt_path(@doubt), notice: "Answer updated"}
            else
                format.html {render :edit}
                format.json {render json: @answer.errors, status: unprocessable_entity}
            end
        end
    end

    private

    def set_answer
        @answer = Answer.find(params[:id])
    end

    def set_doubt
        @doubt = Doubt.find(params[:doubt_id])
    end

    def answer_params
        params.require(:answer).permit(:content, :doubt_id) 
    end
end