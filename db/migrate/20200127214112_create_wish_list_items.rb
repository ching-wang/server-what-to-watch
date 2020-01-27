class CreateWishListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :wish_list_items do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :wish_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
