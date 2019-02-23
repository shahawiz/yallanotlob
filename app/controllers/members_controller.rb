class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_notifications
  # GET /members
  # GET /members.json
  def index
    @notifications = @user.notifications.reverse
    @user = User.find params[:user_id]
    @gruop = @user.gruops.find params[:gruop_id]
    @members = @gruop.members.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @notifications = @user.notifications.reverse
  end

  # GET /members/new
  def new
    @notifications = @user.notifications.reverse
    @user = User.find params[:user_id]
    @gruop = @user.gruops.find params[:gruop_id]
    @member = @gruop.members.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @notifications = @user.notifications.reverse
    @user = User.find params[:user_id]
    @gruop = @user.gruops.find params[:gruop_id]
    @member = @gruop.members.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to user_gruop_path(@gruop.user,@gruop), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to [@user,@gruop,@member], notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to user_gruop_path(@gruop.user,@gruop), notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @user = User.find(params[:user_id])
      @gruop = @user.gruops.find params[:gruop_id]
      @member = @gruop.members.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:user_id, :gruop_id)
    end
    def set_notifications
      @user=current_user
      @notifications = @user.notifications.all.reverse
    end
end
