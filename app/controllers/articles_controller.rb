# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_authorize_article, only: %i[show edit update destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = policy_scope(Article)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show; end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.org_id = current_user.org_id

    respond_to do |format|
      if @article.save
        format.html do
          redirect_to @article, notice: 'Article was successfully created.'
        end
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json do
          render json: @article.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html do
          redirect_to @article, notice: 'Article was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json do
          render json: @article.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html do
        redirect_to articles_url, notice: 'Article was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_authorize_article
    @article = Article.find(params[:id])
    authorize(@article)
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def article_params
    params.require(:article).permit(
      :name, :department, :location, :manufacturer, :model_number, :room,
      :serial_number, :useful_life_span, :description, :org_id,
      :replacement_cost, :purchase_price, :purchase_invoice, :purchase_vendor
    )
  end
end
