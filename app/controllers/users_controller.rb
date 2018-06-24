# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def show; end

  def new
    @user = User.new
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.new(user_params)
    @user.org_id = current_user.org_id
    @user.password = SecureRandom.hex(8)
    @user.password_confirmation = @user.password

    respond_to do |format|
      if @user.save
        format.html do
          redirect_to users_path, notice: 'User was successfully created.'
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
