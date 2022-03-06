class UserPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve
            if user.instance_of?(Admin)
                scope.all
            else
                scope.where(status: [:active, :inactive]).where.not(id: user.id)
            end
        end
    end

    def index?
        (user.instance_of?(Admin) || (user.instance_of?(User) && user.admin?))
    end

    def show?
        index?
    end

    def create?
        user.instance_of?(Admin)
    end

    def new?
        create?
    end

    def update?
        user.instance_of?(Admin)
    end

    def edit?
        update?
    end

    def destroy?
        user.instance_of?(Admin) && @record.suspended?
    end

    def active_and_inactive?
        user.instance_of?(Admin) || (user.instance_of?(User) && user.admin?)
    end
end