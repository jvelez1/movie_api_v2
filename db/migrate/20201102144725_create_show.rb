class CreateShow < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.belongs_to :show, foreign_key: true, null: false
      t.integer :season_number, null: false
      t.text :plot, null: false
      t.timestamps
    end
  end
end
