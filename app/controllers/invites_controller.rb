class InvitesController < ApplicationController
  before_action :set_invite, only: [:show, :edit, :update, :destroy]
  # after_action :verify_authorized

  # GET /invites
  # GET /invites.json
  def index
    @invites = Invite.all
    # authorize @invites
  end

  # GET /invites/1
  # GET /invites/1.json
  def show
  end

  # GET /invites/new
  def new
    @invite = Invite.new
    # authorize @invite
  end

  # GET /invites/1/edit
  def edit
  end

  # POST /invites
  # POST /invites.json
  def create
    @invite = Invite.new(invite_params)
    # authorize @invite
    @invite[:token] = @invite.generate_token

     #check if the user already exists
    if User.exists?(email: invite_params[:email])
      @invitee = User.find_by_email(invite_params[:email]) #find user by email
      @invitee.participations << Participation.new(user_id: @invitee.id, project_id: invite_params[:project_ids],
        associated_user_id: @invitee.id, associated_project_id: invite_params[:project_ids], role_id: invite_params[:role_ids])#create a new participation and add it to the invitee's participations
      @project_invite = Project.find(invite_params[:project_ids])

      if @invite.save
        ExistingInviteMailer.new_existing_user_invite(@invite, @project_invite).deliver_now#email the invitee that he's been added as a participant on that account
        redirect_to subdomain_root_url, notice: 'Invite sent.'
      else
        redirect_to subdomain_root_url, notice: "Error in sending invite."
      end
      #handle role assignment if applicable
      #decide if users should be able to accept/reject invites

    else
     if @invite.save
        InviteMailer.new_user_invite(@invite,
        new_user_registration_url(:invite_token => @invite.token,
        :subdomain => @account.subdomain)).deliver_now
        redirect_to subdomain_root_url, notice: 'Invite sent.'
      else
        redirect_to subdomain_root_url, notice: "Error in sending invite."
      end
    end
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
  def update
    respond_to do |format|
      if @invite.update(invite_params)
        format.html { redirect_to @invite, notice: 'Invite was successfully updated.' }
        format.json { render :show, status: :ok, location: @invite }
      else
        format.html { render :edit }
        format.json { render json: @invite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invites/1
  # DELETE /invites/1.json
  def destroy
    @invite.destroy
    respond_to do |format|
      format.html { redirect_to invites_url, notice: 'Invite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invite
      @invite = Invite.find(params[:id])
      # authorize @invite
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invite_params
      params.require(:invite).permit(:email, :account_id, :project_ids, :role_ids, :sender_id, :receiver_id, :token)
    end
end
