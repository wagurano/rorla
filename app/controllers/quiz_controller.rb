class QuizController < ApplicationController
  def index
  end

  def start
    total = params[:number].to_i
    all = Problem.all.map { |x| x.id }
    session[:problems] = all.sort_by{rand}[0..(total-1)]
    session[:total] = total
    session[:current] = 0
    session[:correct] = 0
    redirect_to action: "problem"
  end

  def problem
    @current = session[:current]
    @total = session[:total]
    if @current >= @total
      redirect_to action: "end"
    else
      @problem = Problem.find(session[:problems][@current])
      @choices = @problem.choices.sort_by{rand}
      # session[:problem] = session[:problems][@current]
      session[:problem] = @problem
      session[:choices] = @choices.map { |c| c.id }
    end
  end

  def answer
    @current = session[:current]
    @total = session[:total]

    choice_id = params[:choice]

    @problem = Problem.find(session[:problems][@current])
    # session[:problem] # Problem.find(session[:problem])
    @choices = []
    session[:choices].each { |c| @choices << Choice.find(c) }

    @choice = choice_id ? Choice.find(choice_id) : nil
    if @choice and @choice.correct
      @correct = true
      session[:correct] += 1
    else
      @correct = false
    end

    session[:current] += 1
  end

  def end
    @correct = session[:correct]
    @total = session[:total]

    @score = @correct * 100 / @total
  end
end
