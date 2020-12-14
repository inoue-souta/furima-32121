class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :purchase_record_id)
  end

end
