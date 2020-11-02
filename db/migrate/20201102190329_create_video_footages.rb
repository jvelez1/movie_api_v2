class CreateVideoFootages < ActiveRecord::Migration[6.0]
  def change
    create_table :video_footages do |t|
      t.string :type, null: false, index: true
      t.string :name, null: false
      t.text :plot, null: false
      t.integer :season_number
      t.timestamps
    end
  end
end
