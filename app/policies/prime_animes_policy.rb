class PrimeAnimesPolicy < ApplicationPolicy
    def index?
        raise Pundit::NotAuthorizedError, "Acesso restrito" unless user.instance_of?(User)
        true
    end

    def show?
        raise Pundit::NotAuthorizedError, "Acesso restrito" unless user.instance_of?(User)
        true
    end
    
    def create?
        raise Pundit::NotAuthorizedError, "Acesso restrito" unless user.instance_of?(User)
        true
    end
    
    def new?
        create?
    end
    
    def update?
        raise Pundit::NotAuthorizedError, "Acesso restrito" unless user.instance_of?(User)
        true
    end
    
    def edit?
        update?
    end
    
    def destroy?
        raise Pundit::NotAuthorizedError, "Acesso restrito" unless user.instance_of?(User)
        true
    end
end