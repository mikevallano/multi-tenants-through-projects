class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_account
  around_filter :scope_current_account

  def current_account
    @account = Account.find_by(subdomain: request.subdomain)
  end

  def current_project
    @current_project = Project.find(params[:project_id]) if params[:project_id].present?
  end

  def belongs_to_project?
    current_user.projects.include?(@current_project) if @current_project.present?
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
