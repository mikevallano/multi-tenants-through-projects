class Account < ActiveRecord::Base

  has_many :projects
  # has_many :users
  belongs_to :user
  has_many :invites
  has_many :posts, through: :projects
  has_many :memberships
  # has_many :roles, through: :memberships


  def self.current_id=(id)
    Thread.current[:account_id] = id
  end

  def self.current_id
    Thread.current[:account_id]
  end
end
