class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :imdb_id, unique: true

      t.string :title
      t.integer :year
      t.string :language
      t.string :poster
      t.references :director, null: false, foreign_key: true

      t.timestamps
    end
  end
end
