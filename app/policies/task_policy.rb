# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def destroy?
    record_exists?
  end

  def complete?
    record_exists?
  end

  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = if user.role == User.roles[:admin]
                 scope
               else
                 scope.where(schedule_id: user.org.schedules.pluck(:id))
               end
    end
  end
end
