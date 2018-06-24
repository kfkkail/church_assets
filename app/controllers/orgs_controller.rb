# frozen_string_literal: true

class OrgsController < ApplicationController
  before_action :set_authorize_org, only: %i[show edit update destroy]

  # GET /orgs
  # GET /orgs.json
  def index
    @orgs = policy_scope(Org)
  end

  # GET /orgs/1
  # GET /orgs/1.json
  def show; end

  # GET /orgs/1/edit
  def edit; end

  # PATCH/PUT /orgs/1
  # PATCH/PUT /orgs/1.json
  def update
    respond_to do |format|
      if @org.update(org_params)
        format.html do
          redirect_to @org, notice: 'Org was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @org }
      else
        format.html { render :edit }
        format.json { render json: @org.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authorize_org
    @org = Org.find(params[:id])
    authorize(@org)
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def org_params
    params.require(:org).permit(:name)
  end
end
