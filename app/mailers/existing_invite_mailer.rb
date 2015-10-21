class ExistingInviteMailer < ApplicationMailer
  def new_existing_user_invite(invite, project)
    @sender = invite.sender.email
    @link = "#{project.account.subdomain}.lvh.me:3000#{project_path(project)}"
    mail( :to => invite.email, :from => @sender, :subject => "You've been added to a new project" )
  end
end