class PostPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists?
    # user.projects.include?(record.project) #this refused to fucking work
  end

  def create?
    user.admin? || user.account_owner? || user.manager?
  end

  def new?
    create?
  end

  def update?
    user.admin? || user.account_owner? || user.manager? #|| record_owner?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  private

  # def access_to_project? #TODO: this still needs to actually be enforced by pundit
  #   user.account_owner? || user.projects.include?(@current_project) if @current_project.present?
  # end

end