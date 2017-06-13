class ApplicationPolicy
  attr_reader :employee, :record

  def initialize(employee, record)
    @employee = employee
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(employee, record.class)
  end

  class Scope
    attr_reader :employee, :scope

    def initialize(employee, scope)
      @employee = employee
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
