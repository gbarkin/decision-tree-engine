class WorkflowsController < ApplicationController
  def index
    @workflows = Workflow.all
  end

  def show
    @workflow = Workflow.includes(questions: :answer_options).find(params[:id])
  end

  def new
    @workflow = Workflow.new
  end

  def create
    @workflow = Workflow.new(workflow_params)
    if @workflow.save
      redirect_to @workflow, notice: "Workflow created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @workflow = Workflow.find(params[:id])
  end

  def update
    @workflow = Workflow.find(params[:id])
    if @workflow.update(workflow_params)
      redirect_to @workflow, notice: "Workflow updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def start_run
    workflow = Workflow.find(params[:id])
    run = workflow.workflow_runs.create!(started_at: Time.current)
    redirect_to workflow_run_path(run)
  end

  private

  def workflow_params
    params.require(:workflow).permit(:name, :description, :start_question_id)
  end
end
