class StudentPolicy < ApplicationPolicy

    def index?
        user.can?(:students, :read)
    end

    def show?
        user.can?(:students, :read)
    end

    def create?
        user.can?(:students, :create)
    end

    def new?
        create?
    end

    def update?
        user.can?(:students, :update)
    end

    def edit?
        update?
    end

    def destroy?
        user.can?(:students, :destroy)
    end

     class Scope < Scope
    def resolve
      if user.can?(:students, :read)
        scope.all   # show all students
      else
        scope.none  # show nothing
      end
    end
  end
end