class AnswerOptionsController < ApplicationController
  before_action :set_answer, only: [:edit, :update, :destroy]

  def new
    @question = Question.find(params[:question_id])
    @answer_option = @question.answer_options.build
  end

  def create
    @question = Question.find(params[:question_id])
    @answer_option = @question.answer_options.build(answer_params)

    if @answer_option.save
      redirect_to @question.workflow, notice: "Answer added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      redirect_to @answer.question.workflow, notice: "Answer updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    workflow = @answer.question.workflow
    @answer.destroy
    redirect_to workflow, notice: "Answer deleted"
  end

  private

  def set_answer
    @answer = AnswerOption.find(params[:id])
  end

  def answer_params
    params.require(:answer_option)
          .permit(:label, :value, :position, :next_question_id, :outcome_key)
  end
end
