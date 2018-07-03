# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def destroy?
    record_exists?
  end
end
