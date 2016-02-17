class ApplicationPolicy
  attr_reader :user, :record, :ctrl

  def initialize(user_context, record)
    @user = user_context.user
    @ctrl = user_context.ctrl
    @record = record
  end

  def index?
    user.admin?
  end

  def show?
    # scope.where(:id => record.id).exists?
    user.admin?
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope, :ctrl

    def initialize(user_context, scope)
      @user = user_context.user
      @ctrl = user_context.ctrl
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
