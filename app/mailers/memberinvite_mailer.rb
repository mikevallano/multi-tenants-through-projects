class MemberinviteMailer < ApplicationMailer
  def new_member_invite(memberinvite, memberinvite_url)
    @sender = memberinvite.sender.email
    @link = memberinvite_url
    mail( :to => memberinvite.email, :from => @sender, :subject => "You've been invited to the textit tester app" )
  end
end
