# frozen_string_literal: true

class SchedulesController < ApplicationController
  before_action :set_authorize, only: %i[show edit update destroy]

  def index
    @schedules = policy_scope(Schedule)
  end

  def show; end

  def new
    @schedule = Schedule.new(schedule_params)
  end

  # GET /schedules/1/edit
  def edit; end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html do
          redirect_to @schedule.article, notice: 'Schedule was successfully created.'
        end
        format.json { render :show, status: :created, location: @scheduler }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html do
          redirect_to @schedule.article, notice: 'Schedule was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @schedule.article }
      else
        format.html { render :edit }
        format.json do
          render json: @schedule.errors, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html do
        redirect_to @schedule.article, notice: 'Schedule was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  protected

  def schedule_params
    params.require(:schedule).permit(:name, :duration, :article_id, :user_id)
  end

  def set_authorize
    @schedule = Schedule.find(params[:id])
    authorize(@schedule)
  end
end
