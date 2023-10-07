# frozen_string_literal: true

class BoardPolicy < ApplicationPolicy
  class Scope < Scope
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end
