class Role < ActiveRecord::Base

  # default_scope { where(account_id: Account.current_id) }

  has_many :memberships
  has_many :users, through: :memberships
  # has_many :projects, through: :memberships
  # has_many :accounts, through: :memberships
end
