class Project < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  extend FriendlyId
    friendly_id :name, use: [:history, :scoped], :scope => :account

  # scope :by_user, lambda { |user| where(:user_id => user.id) }

  def should_generate_new_friendly_id?
    name_changed?
  end


  belongs_to :account
  # has_many :memberships
  has_many :participations
  # has_many :users, through: :memberships
  has_many :users, through: :participations
  has_many :posts
  has_many :chats


  def self.current_id=(id)
    Thread.current[:project_id] = id
  end

  def self.current_id
    Thread.current[:project_id]
  end
end
