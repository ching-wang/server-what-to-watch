class Api::V1::WishListsController < ApplicationController
  def index
    if !logged_in?
      protected_action()
      return
    end

    wish_lists = WishList.where("user_id = ?", @current_user.id)
    render json: wish_lists
  end

  def show
    wishList = WishList.find_by(id: params[:id])
    render json: wishList, include: [wish_list_items: [:movie]]
  end

  def create
    if !logged_in?
      protected_action()
      return
    end

    wishList = WishList.new(wishList_params)
    wishList.user_id = @current_user.id
    wishList.save
    render json: { wishlist: WishListSerializer.new(wishList) }
  end

  def update
    if !logged_in?
      protected_action()
      return
    end

    wishList = WishList.find_by(params[:id])
    wishList.update(wishList_params)
    render json: { wishlist: WishListSerializer.new(wishList) }
  end

  def destroy
    if !logged_in?
      protected_action()
      return
    end

    wish_list = WishList.find_by(id: params[:id])
    if !wish_list
      render json: { errors: ["No such wish list"] }, status: :not_found
      return
    end

    if wish_list.user_id != @current_user.id
      render json: { errors: ["You can't delete other people's wish lists!"] }, status: :unauthorized
      return
    end
    deleted = wish_list.destroy
    render json: deleted
  end

  private

  def wishList_params
    params.permit(:name, :description, :image)
  end
end
