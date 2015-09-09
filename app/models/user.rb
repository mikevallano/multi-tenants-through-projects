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
  after_create :assign_owner_id

  private

    def set_account
      build_account unless account.present?
    end

    def assign_owner_id
      unless account.owner_id.present?
        account.owner_id = self.id
        self.role_ids = Role.find_by_name("account owner").id
      end
    end

end
