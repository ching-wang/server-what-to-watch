class CreateActorMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_movies do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
