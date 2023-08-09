class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = current_user.groups.includes(:entities)
    
    # Calculate total amount for each group
    @groups.each do |group|
      group.total_amount = group.entities.sum(:amount)
    end
  end

  def show
    @entities = @group.entities.order(created_at: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to group_path(@group), notice: 'Group created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: 'Group updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, notice: 'Group deleted successfully.'
  end

  private

  def set_group
    @group = current_user.groups.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
