class CurrencyPolicy < ApplicationPolicy
  class Scope < Scope

    def atualizar?
      user.role?
    end


    def resolve
      scope
    end
  end
end
