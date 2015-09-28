class Membership < ActiveRecord::Base

  # default_scope { where(account_id: Account.current_id) }

  # belongs_to :project
  # belongs_to :role
  # belongs_to :user
  belongs_to :associated_account, class_name: 'Account'
  belongs_to :associated_user, class_name: 'User'

end
