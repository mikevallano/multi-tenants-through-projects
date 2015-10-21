class MemberinvitesController < ApplicationController
  before_action :set_memberinvite, only: [:show, :edit, :update, :destroy]

  # GET /memberinvites
  # GET /memberinvites.json
  def index
    @memberinvites = Memberinvite.all
  end

  # GET /memberinvites/1
  # GET /memberinvites/1.json
  def show
  end

  # GET /memberinvites/new
  def new
    @memberinvite = Memberinvite.new
  end

  # GET /memberinvites/1/edit
  def edit
  end

  # POST /memberinvites
  # POST /memberinvites.json
  def create
    @memberinvite = Memberinvite.new(memberinvite_params)
    @memberinvite[:member_token] = @memberinvite.generate_token

    #check if the user already exists
    if User.exists?(email: memberinvite_params[:email])
      @invitee = User.find_by_email(memberinvite_params[:email]) #find user by email
      @invitee.memberships << Membership.new(user_id: @invitee.id, account_id: memberinvite_params[:account_id],
        associated_user_id: @invitee.id, associated_account_id: memberinvite_params[:account_id])#create a new membership and add it to the invitee's memberships
      @account_invite = Account.find(memberinvite_params[:account_id])
      if @memberinvite.save
        ExistingMemberinviteMailer.new_existing_member_invite(@memberinvite, @account_invite).deliver_now#email the invitee that he's been added as a member on that account
        redirect_to subdomain_root_url, notice: 'Invite sent.'
      else
        redirect_to subdomain_root_url, notice: "Error in sending invite."
      end
      #handle role assignment if applicable
      #decide if users should be able to accept/reject invites



  else
     if @memberinvite.save
        MemberinviteMailer.new_member_invite(@memberinvite,
        new_user_registration_url(:memberinvite_token => @memberinvite.member_token)).deliver_now
        redirect_to subdomain_root_url, notice: 'Invite sent.'
      else
        redirect_to subdomain_root_url, notice: "Error in sending invite."
      end
    end
  end

  # PATCH/PUT /memberinvites/1
  # PATCH/PUT /memberinvites/1.json
  def update
    respond_to do |format|
      if @memberinvite.update(memberinvite_params)
        format.html { redirect_to @memberinvite, notice: 'Memberinvite was successfully updated.' }
        format.json { render :show, status: :ok, location: @memberinvite }
      else
        format.html { render :edit }
        format.json { render json: @memberinvite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberinvites/1
  # DELETE /memberinvites/1.json
  def destroy
    @memberinvite.destroy
    respond_to do |format|
      format.html { redirect_to memberinvites_url, notice: 'Memberinvite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memberinvite
      @memberinvite = Memberinvite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memberinvite_params
      params.require(:memberinvite).permit(:email, :account_id, :sender_id, :receiver_id, :token)
    end
end
