class Project < ActiveRecord::Base
  belongs_to :account
  has_many :memberships
  has_many :users, through: :memberships
  has_many :posts
  # has_many :roles, through: :memberships

  default_scope { where(account_id: Account.current_id) }

  def self.current_id=(id)
    Thread.current[:project_id] = id
  end

  def self.current_id
    Thread.current[:project_id]
  end
end
