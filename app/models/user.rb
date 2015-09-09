class User < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  has_many :memberships
  has_many :roles, through: :memberships
  has_many :projects, through: :memberships

  accepts_nested_attributes_for :account

  after_initialize :set_account

  private

    def set_account
      build_account unless account.present?
    end

end
