class ProblemsController < ApplicationController
  before_action :set_problem, only: [ :show, :edit, :update]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to(@problem, notice: 'Problem was successfully created.')
    else
      render action: 'new'
    end
  end

  def update
    if @problem.update_attributes(problem_params)
      redirect_to @problem, notice: 'Problem was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_url
  end

private
  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:text)
  end
end
