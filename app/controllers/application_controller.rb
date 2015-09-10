class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  include Pundit

  before_action :current_account
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :scope_current_account
  before_action :current_project
  around_action :scope_current_project

  def current_account
    @account = Account.find_by(subdomain: request.subdomain)
  end

  def current_project
    @project_name = params[:project_id]
    @current_project = Project.friendly.find(@project_name) if @project_name.present?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,
      account_attributes: [:subdomain])
    }
  end

  def can_access_project? #TODO: is this the best way to enforce?
    @permitted_account = current_user.account #identify a place to redirect user to
    unless current_user.projects.include?(@current_project) || current_user.account_owner?
      redirect_to root_url(:subdomain => @permitted_account.subdomain), notice: 'You are not part of that project.'
    end
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

  def scope_current_project
    Project.current_id = current_project.id if current_project.present?
      yield
    ensure
      Project.current_id = nil
  end
end
