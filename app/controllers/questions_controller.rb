class QuestionsController < ApplicationController
  before_action :set_question, only: [:edit, :update, :destroy]

  def new
    @workflow = Workflow.find(params[:workflow_id])
    @question = @workflow.questions.build
  end

  def create
    @workflow = Workflow.find(params[:workflow_id])
    @question = @workflow.questions.build(question_params)

    if @question.save
      redirect_to @workflow, notice: "Question added"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to @question.workflow, notice: "Question updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    workflow = @question.workflow
    @question.destroy
    redirect_to workflow, notice: "Question deleted"
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text, :kind, :position)
  end
end
