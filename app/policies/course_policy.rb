class CoursePolicy < ApplicationPolicy
    def index?
        user.can?(:courses, :read)
    end

    def show?
        user.can?(:courses, :read)
    end

    def create?
        user.can?(:courses, :create)
    end

    def new?
        create?
    end

    def update?
        user.can?(:courses, :update)
    end

    def edit?
        update?
    end

    def destroy?
        user.can?(:courses, :destroy)
    end
end