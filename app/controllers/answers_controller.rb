class AnswersController < ApplicationController
  
  
  def create
    @answer = Answer.create(answer_params)
    if @answer.save 
      redirect_to question_path(@answer.question)
    else
      # alert message
      redirect_to question_path(@answer.question)
    end
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    if @answer && @answer.destroy
      redirect_to @answer.question
    end
  end
  
  private

  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
  
end
