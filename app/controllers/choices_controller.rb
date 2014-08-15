class ChoicesController < ApplicationController
  def create
    @problem = Problem.find(params[:problem])
    text = 
    correct = 
    a = Choice.create(text: params[:text], correct: params[:correct] == "1", problem_id: @problem.id)
    if a.correct
      @problem.answer = a
    end
    redirect_to problem_path(@problem)
  end

  def destroy
    @problem = Problem.find(params[:problem])
    @choice = Choice.find(params[:choice])
    @choice.destroy
    redirect_to problem_path(@problem)
  end
end
