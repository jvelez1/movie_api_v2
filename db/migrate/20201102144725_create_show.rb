class CreateShow < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :name, null: false
      t.text :plot, null: false
      t.timestamps
    end
  end
end
