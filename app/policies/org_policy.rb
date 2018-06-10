class OrgPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      if user.role == User.roles[:admin]
        @scope = scope
      else
        @scope = scope.where(id: user.org_id)
      end
    end
  end
end
