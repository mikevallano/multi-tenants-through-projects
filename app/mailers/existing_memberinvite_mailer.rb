class ExistingMemberinviteMailer < ApplicationMailer
  def new_existing_member_invite(memberinvite, account_invite)
    @sender = memberinvite.sender.email
    @account = account_invite.subdomain
    @link = "#{@account}.lvh.me:3000"
    mail( :to => memberinvite.email, :from => @sender, :subject => "You've been added to an account!" )
  end
end
