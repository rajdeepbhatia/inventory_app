class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:edit, :show, :destroy]

  def index
    @items = Item.load_table_data
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(item_params.merge(updated_by: current_user.id))
    flash[:success] = t('items.success.created') if @item.save
  end

  def show
    @item = Item.load_details(params[:id])
    flash[:error] = t('items.error.not_found') and return if @item.blank?
  end

  def edit
  end

  def update
    @item = Item.find_by(id: params[:id])
    flash[:error] = t('items.error.not_found') and return if @item.blank?
    @updated = @item.update(item_params.merge(updated_by: current_user.id))
  end

  def destroy
    @item.destroy
    flash[:success] = t('items.success.deleted')
    redirect_to authenticated_root_path
  end

  def allotment_options
    @item = Item.find_by(id: params[:id])
    @error = t('items.error.not_found') and return if @item.blank?
  end

  def change_allotment_status
    @item = Item.find_by(id: params[:id])
    flash[:error] = t('items.error.not_found') and return if @item.blank?
    @updated = @item.update(item_params.merge(updated_by: current_user.id))
    flash[:success] = t('items.success.allotment_updated') and return if @updated
    flash[:error] = @item.errors.full_messages.first
  end

  private
  def set_item
    @item = Item.find_by(id: params[:id])
    if @item.blank?
      flash[:error] = I18n.t('items.error.not_found')
      redirect_to authenticated_root_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :brand_id, :sku, :serial, :purchased_at, :person_id)
  end
end
