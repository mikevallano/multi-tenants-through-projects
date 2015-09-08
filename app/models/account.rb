class Account < ActiveRecord::Base

  has_many :projects
  has_many :users, through: :projects
  has_many :posts, through: :projects


  def self.current_id=(id)
    Thread.current[:account_id] = id
  end

  def self.current_id
    Thread.current[:account_id]
  end
end
