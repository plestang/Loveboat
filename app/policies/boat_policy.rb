class BoatPolicy < ApplicationPolicy
  def index?
    return true
  end
  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end