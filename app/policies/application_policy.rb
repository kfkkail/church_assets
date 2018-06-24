# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def record_exists?
    scope.where(id: record.id).exists?
  end

  def index?
    false
  end

  def show?
    record_exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    record_exists?
  end

  def edit?
    record_exists?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = if user.role == User.roles[:admin]
                 scope
               else
                 scope.where(org_id: user.org_id)
               end
    end

    def resolve
      @scope.all
    end
  end
end
