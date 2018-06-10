class OrgPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user = user
      @scope = scope.where(id: user.org_id)
    end
  end
end
