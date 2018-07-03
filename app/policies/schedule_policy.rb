# frozen_string_literal: true

class SchedulePolicy < ApplicationPolicy
  def destroy?
    record_exists?
  end

  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = if user.role == User.roles[:admin]
                 scope
               else
                 scope.where(article_id: user.org.articles.pluck(:id))
               end
    end
  end
end
