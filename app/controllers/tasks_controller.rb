# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_authorize_task, only: %i[show edit update destroy complete]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = policy_scope(Task)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new(task_params)
  end

  # GET /tasks/1/edit
  def edit; end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.org_id = current_user.org_id

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to @task, notice: 'Task was successfully created.'
        end
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html do
          redirect_to tasks_url, notice: 'Task was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html do
        redirect_to tasks_url, notice: 'Task was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  def complete
    @task.completed_date = (Time.now if @task.completed_date.nil?)
    respond_to do |format|
      if @task.save
        @task.completion
        format.html do
          redirect_to tasks_url
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authorize_task
    @task = Task.find(params[:id])
    authorize(@task)
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def task_params
    params.require(:task).permit(:name, :description, :org_id, :article_id, :due_date)
  end
end
