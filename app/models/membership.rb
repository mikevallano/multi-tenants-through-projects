class Membership < ActiveRecord::Base

  # default_scope { where(account_id: Account.current_id) }

  belongs_to :project
  belongs_to :role
  belongs_to :user
  belongs_to :account

end
