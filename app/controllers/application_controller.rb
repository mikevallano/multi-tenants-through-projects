class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_account
  around_action :scope_current_account
  before_action :current_project

  def current_account
    @account = Account.find_by(subdomain: request.subdomain)
  end

  def current_project
    @project_id = params[:project_id]
    @current_project = Project.find(@project_id) if @project_id.present?
  end

  def access_to_project? #TODO: this still needs to actually be enforced by pundit
    current_user.projects.include?(@current_project) if @current_project.present? && current_user.present?
  end

  def require_account!
    redirect_to root_url unless @account.present?
  end

  def scope_current_account
    Account.current_id = current_account.id if current_account.present?
      yield
    ensure
      Account.current_id = nil
  end

end
