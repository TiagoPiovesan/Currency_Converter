class UserPolicy < ApplicationPolicy

  def new?
    user.role?
  end

  def edit?
    user.role?
  end


  class Scope < Scope
    def resolve
      scope
    end
  end
end
