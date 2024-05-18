class Api::V1::GroupMembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @group_members = GroupMember.all
    render json: @group_members, each_serializer: GroupMemberSerializer
  end

  def show
    @group_member = GroupMember.find(params[:id])
    render json: @group_member, serializer: GroupMemberSerializer
  end

  def create
    @group_member = current_user.group_members.create!(group_member_params)
    render json: @group_member, serializer: GroupMemberSerializer
  end

  private

  def group_member_params
    params.require(:group_member).permit(:group_id, :user_id)
  end
end

