# frozen_string_literal: true

class OrgPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = if user.role == User.roles[:admin]
                 scope
               else
                 scope.where(id: user.org_id)
               end
    end
  end
end
