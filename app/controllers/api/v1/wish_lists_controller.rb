class Api::V1::WishListsController < ApplicationController
  def show
    wishList = WishList.find_by(id: params[:id])
    render json: wishList, include: [wish_list_items: [:movie]]
  end

  # def create
  # end

  # def update
  #   wishList.update(wishList_params)
  #   render json: { user: WishListSerializer.new(wishList) }
  # end

  # private

  # def wishList_params
  #   params.require(:wishList).permit(:name, :description, :image)
  # end
end
