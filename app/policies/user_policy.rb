class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
    byebug
  end

  def show?
    record == user || user.admin?
  end

  def update?
    record == user || user.admin?
  end

  def destroy?
    user.admin? && (record != user)
  end
end