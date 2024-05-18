class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
    render json: @groups, each_serializer: GroupSerializer
  end

  def show
    @group = Group.find(params[:id])
    render json: @group, serializer: GroupSerializer
  end

  def create
    @group = current_user.groups.create!(group_params)
    render json: @group, serializer: GroupSerializer
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end