class User < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  has_many :memberships
  has_many :roles, through: :memberships
  has_many :projects, through: :memberships
  has_many :accounts, through: :projects

  def my_projects
    self.projects.unscoped
  end

  def accounts
    self.projects.unscoped.all.map{ |project| project.account }.uniq
  end
end
