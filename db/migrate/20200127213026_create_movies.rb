class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :released
      t.string :language
      t.string :poster
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
