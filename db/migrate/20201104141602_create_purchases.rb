class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :video_footage
      t.datetime :expiry_date, null: false
      t.float :price, null: false, default: 0, precision: 16, scale: 2
      t.string :video_quality, null: false, default: 'HD'
      t.timestamps
    end
  end
end
