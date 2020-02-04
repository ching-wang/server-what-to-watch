class Api::V1::WishListsController < ApplicationController
  def show
    wishList = WishList.find_by(id: params[:id])
    render json: wishList, include: [wish_list_items: [:movie]]
  end

  def create
    wishList = WishList.find_or_create_by(params[:wishList_params])
    render json: { wishlist: WishListSerializer.new(wishList) }
  end

  def update
    wishList = WishList.find_by(params[:wish_list_id])
    wishList.update(wishList_params)
    render json: { wishlist: WishListSerializer.new(wishList) }
  end

  def destroy
    wishList = WishList.find_by(params[:wish_list_id])
    deleteWishlist = wishList.destroy
    render json: deleteWishlist
  end

  private

  def wishList_params
    params.require(:wishList).permit(:name, :description, :image)
  end
end
