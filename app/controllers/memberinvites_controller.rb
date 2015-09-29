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
     if @memberinvite.save
        MemberinviteMailer.new_member_invite(@memberinvite,
        new_user_registration_url(:memberinvite_token => @memberinvite.member_token)).deliver_now
        redirect_to subdomain_root_url, notice: 'Invite sent.'
      else
        redirect_to subdomain_root_url, notice: "Error in sending invite."
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
