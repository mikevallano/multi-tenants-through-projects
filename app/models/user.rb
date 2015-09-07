class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
