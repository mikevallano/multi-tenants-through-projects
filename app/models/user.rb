class User < ActiveRecord::Base

  default_scope { where(account_id: Account.current_id) }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :account
  has_many :memberships
  has_many :roles, through: :memberships
  has_many :projects, through: :memberships

  has_many :received_invites, :class_name => "Invite", :foreign_key => 'receiver_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'

  accepts_nested_attributes_for :account

  after_initialize :set_account
  after_create :assign_owner_id
  after_create :set_invite_receiver_id

  def account_owner?
    self.roles.map(&:name).include?("account owner") || self.account.owner_id == self.id
  end

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

    def set_invite_receiver_id
      invite = Invite.find_by_email(self.email)
      if invite.present?
        unless invite.receiver_id.present?
          invite.receiver_id = self.id
          invite.save
        end
      end
    end

end
