class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.text :plot, null: false
      t.integer :year, null: false
      t.string :directed_by, null: false
      t.string :production_company, null: false
      t.string :country, null: false
      t.timestamps
    end
  end
end
