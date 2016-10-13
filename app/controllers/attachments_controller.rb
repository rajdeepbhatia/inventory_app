class AttachmentsController < ApplicationController
  before_action :authenticate_user!, :set_item

  def index
    @attachments = @item.attachments
  end

  def create
    attachment = @item.attachments.new(image: params[:file])
    if attachment.save
      render json: attachment, status: :created
    else
      render json: { error: attachment.errors.first }, status: :unprocessed_entity
    end
  end

  private
  def set_item
    @item = Item.find_by(id: params[:item_id])
    if @item.blank?
      flash[:error] = I18n.t('items.error.not_found')
      redirect_to items_path
    end
  end
end
