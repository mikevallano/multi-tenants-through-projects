class Invite < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  belongs_to :account
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'

  require 'securerandom'

  def generate_token
    SecureRandom.uuid + [Time.now.to_i, rand(100..1000)].join
  end


end
