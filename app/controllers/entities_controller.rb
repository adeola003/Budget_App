class EntitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = @group.entities.order(created_at: :desc)
    @total_amount = @entities.sum(:amount)
  end

  def show
  end

  def new
    @entity = @group.entities.build
  end

  def create
    @entity = @group.entities.build(entity_params)
    @entity.user = current_user
    if @entity.save
      redirect_to group_entities_path(@group), notice: "Entity created successfully."
    else
      puts @entity.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @entity.update(entity_params)
      redirect_to group_entities_path(@group), notice: "Entity updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to group_entities_path(@group), notice: "Entity deleted successfully."
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def set_entity
    @entity = @group.entities.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
