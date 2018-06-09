class UsersController < ApplicationController
  def index
    @users = User.where(org_id: current_user.org_id)
  end
end
