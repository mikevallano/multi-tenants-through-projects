class ProjectPolicy < ApplicationPolicy

  def index?
    true #can likely just call out if the user can show? to only show projects the user belongs to
  end

  def show?
    scope.where(:id => record.id).exists?
    user.admin? #|| user.account_owner? || user.projects.include?(record) #need to test this out
  end

  def create?
    user.admin? #|| user.account_owner?
  end

  def new?
    create?
  end

  def update?
    user.admin? #|| user.account_owner?
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? #|| user.account_owner?
  end

end