class AllotmentHistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find_by(id: params[:item_id])
    @error = t('items.error.not_found') and return if @item.blank?
    @histories = AllotmentHistory.load_table_data(@item.id)
  end
end
