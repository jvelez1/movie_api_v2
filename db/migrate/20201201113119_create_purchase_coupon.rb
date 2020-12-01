class CreatePurchaseCoupon < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases_coupons, id: false do |t|
      t.belongs_to :purchase, foreign_key: true, null: false
      t.belongs_to :coupon, foreign_key: true, null: false
    end

    add_index :purchases_coupons, [:purchase_id, :coupon_id], unique: true
  end
end
