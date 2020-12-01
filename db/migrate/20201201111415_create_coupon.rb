class CreateCoupon < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string :code, null: false, index: true
    end
  end
end
